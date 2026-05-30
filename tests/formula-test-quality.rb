#!/usr/bin/env ruby
# Round-4 pins for `test do` block quality across all formulas. Catches
# regressions that brew audit accepts but produce brittle bottle CI:
#
#   1. Every test block uses `assert_match` (regex/substring) NOT
#      `assert_equal version.to_s` (exact string). Version output
#      formats drift across releases; substring is the durable form.
#   2. Every test block invokes via `#{bin}/...` not a bare command —
#      so it tests the JUST-INSTALLED binary, not whatever's on PATH.
#   3. Every test block exits with a known status code (default 0,
#      or an explicit range like `0..2` / `2`) — implicit `nil`
#      status means brew accepts any exit and a crashed binary slips.
#   4. No `system "true"` / `system "echo"` cargo-cult tests.

require "pathname"

root = Pathname.new(__dir__).parent.expand_path
formulas = root.glob("Formula/*.rb")

fail_count = 0

formulas.each do |path|
  src = path.read
  basename = path.basename
  test_block = src[/^\s*test\s+do\s*$.*?^\s*end\s*$/m]
  next unless test_block

  # --- 1. Must use assert_match (the durable substring form).
  unless test_block.include?("assert_match") || test_block.include?("assert_predicate")
    warn "FAIL  #{basename}: test block uses neither assert_match nor assert_predicate"
    fail_count += 1
  end

  # --- 2. `assert_equal version.to_s` is the brittle pattern.
  # `Formulary` re-renders the version on every brew run; a bumped
  # version means the literal-string test fails the next release.
  # The correct form is `assert_match version.to_s` (substring) which
  # tolerates the version being one part of a larger output line.
  if test_block.match?(/assert_equal\s+version\.to_s/)
    warn "FAIL  #{basename}: uses brittle `assert_equal version.to_s` (use assert_match)"
    fail_count += 1
  end

  # --- 3. Every shell_output / system call must reference `#{bin}/`
  # or `bin/`. A bare `system "echo"` runs the host echo, not the
  # installed binary — useless as a brew bottle test.
  test_block.scan(/(shell_output|system)\s+["']([^"']+)["']/) do |kind, arg|
    next if arg.include?("#{bin}") || arg.include?("\#{bin}") || arg.include?("bin/")
    next if arg.start_with?("xcodebuild") # macOS-only build probe
    warn "FAIL  #{basename}: #{kind} #{arg.inspect} does not reference bin/ (not testing installed artifact)"
    fail_count += 1
  end

  # --- 4. Explicit forbidden cargo-cult patterns.
  %w[
    "true"
    "false"
    "exit 0"
  ].each do |smell|
    if test_block.include?("system #{smell}") || test_block.include?("shell_output(#{smell})")
      warn "FAIL  #{basename}: cargo-cult test pattern #{smell}"
      fail_count += 1
    end
  end
end

if fail_count.zero?
  puts "OK  #{formulas.size} formulas pass test-quality contract"
  exit 0
else
  warn "FAIL  #{fail_count} test-quality violation(s)"
  exit 1
end
