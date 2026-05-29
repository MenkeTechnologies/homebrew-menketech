#!/usr/bin/env ruby
# Lightweight cross-formula consistency pins. Catches drift that
# `ruby -c` and `brew audit` miss:
#
#   1. Every Formula/*.rb defines a `class` matching the filename
#      (homebrew taps `Foo` → `foo.rb`).
#   2. Every formula carries a `desc`, `homepage`, `version`, and
#      `license` (Homebrew auto-rejects PRs without these).
#   3. Every formula has at least one `bottle` block OR a `bin.install`
#      so a `brew install` actually deposits an artifact.
#   4. The README's `formulas-N` badge matches the actual count.

require "pathname"

root = Pathname.new(__dir__).parent.expand_path
formulas = root.glob("Formula/*.rb")

fail_count = 0

formulas.each do |path|
  src = path.read
  stem = path.basename(".rb").to_s
  expected_class = stem.split(/[-_]/).map { |w| w[0].to_s.upcase + w[1..-1].to_s }.join.tr("-_", "")
  unless src.match?(/^class\s+#{Regexp.escape(expected_class)}\s*<\s*Formula/)
    warn "FAIL  #{path.basename}: expected `class #{expected_class} < Formula`"
    fail_count += 1
  end
  %w[desc homepage version license].each do |field|
    next if src.include?("#{field} ")
    warn "FAIL  #{path.basename}: missing #{field}"
    fail_count += 1
  end
  unless src.include?("bin.install") || src.include?("bottle do") || src.include?("libexec.install")
    warn "FAIL  #{path.basename}: no install (bin.install / libexec.install / bottle do)"
    fail_count += 1
  end

  # --- HTTPS-only urls. Homebrew's `brew audit --strict` rejects http:.
  src.scan(/^\s*url\s+"([^"]+)"/) do |(u)|
    unless u.start_with?("https://")
      warn "FAIL  #{path.basename}: non-HTTPS url #{u}"
      fail_count += 1
    end
  end

  # --- sha256 must be 64 lowercase-hex chars AND not all zeros
  # (a placeholder-style "0"*64 hash trivially matches any tarball
  # only if Homebrew's verifier is broken — but it's a red flag and
  # historically has shipped accidentally).
  src.scan(/^\s*sha256\s+"([^"]+)"/) do |(h)|
    unless h.match?(/\A[0-9a-f]{64}\z/)
      warn "FAIL  #{path.basename}: invalid sha256 (#{h.length} chars, not 64 lowercase hex): #{h[0, 16]}…"
      fail_count += 1
    end
    if h == "0" * 64 || h == "" || h.match?(/\A0+\z/)
      warn "FAIL  #{path.basename}: zero-pattern sha256 (placeholder)"
      fail_count += 1
    end
  end

  # --- Version must appear inside every url. Homebrew downloads from
  # github releases keyed by tag; a url that doesn't embed the version
  # string is sourcing the wrong tarball and `brew install foo@1.2`
  # silently picks the latest tag.
  version_str = src[/^\s*version\s+"([^"]+)"/, 1]
  if version_str
    src.scan(/^\s*url\s+"([^"]+)"/) do |(u)|
      unless u.include?(version_str)
        warn "FAIL  #{path.basename}: url does not embed version #{version_str.inspect} (#{u})"
        fail_count += 1
      end
    end
  end

  # --- Every formula needs a `test do` block. `brew test foo` is how
  # Homebrew validates the bottle actually runs — a formula without one
  # ships broken to users with zero CI signal.
  unless src.match?(/^\s*test\s+do\s*$/)
    warn "FAIL  #{path.basename}: missing `test do` block"
    fail_count += 1
  end
end

readme = root.join("README.md")
if readme.exist?
  claimed = readme.read[/formulas-(\d+)/, 1]&.to_i
  actual = formulas.size
  if claimed && claimed != actual
    warn "FAIL  README badge says formulas-#{claimed} but Formula/ holds #{actual}"
    fail_count += 1
  end
end

if fail_count.zero?
  puts "OK  #{formulas.size} formulas pass consistency contract"
  exit 0
else
  warn "FAIL  #{fail_count} consistency violation(s)"
  exit 1
end
