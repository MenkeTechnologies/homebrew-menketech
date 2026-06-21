class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.18"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.18/stryke-v0.17.18-aarch64-apple-darwin.tar.gz"
      sha256 "e3c0b356b70bcc880fd7f6d541f286f3a5ec3bf34fc0d8a06f361460ce0a3f95"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.18/stryke-v0.17.18-x86_64-apple-darwin.tar.gz"
      sha256 "6c2331370229dd0ade631c4042908e8695c2f52cf95cc471691b42098491fe49"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.18/stryke-v0.17.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.18/stryke-v0.17.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a4496c3af2e171430b95beb364742c03cf025666862fc2f5f32fcb01111d8b4"
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
