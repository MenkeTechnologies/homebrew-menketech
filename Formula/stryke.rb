class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.16.34"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.34/stryke-v0.16.34-aarch64-apple-darwin.tar.gz"
      sha256 "7018db73b9b8a83838c02cf47b6edf557a764bf417e5105c3ace24188da2e72c"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.34/stryke-v0.16.34-x86_64-apple-darwin.tar.gz"
      sha256 "3a2e079244d1b52921dff4e67d64a1d46f4a033eb2904ae582b9293938fab610"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.34/stryke-v0.16.34-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.34/stryke-v0.16.34-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "880a5baebaf76da509f593245b82c3d17aff04fa6b55a6763145410fc941f6d1"
    end
  end

  def install
    bin.install "stryke"
    bin.install "st"
    bin.install "s"
  end

  test do
    assert_match "hello", shell_output("#{bin}/s -e 'print \"hello\"'")
  end
end
