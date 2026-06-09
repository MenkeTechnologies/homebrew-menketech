class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.16.35"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.35/stryke-v0.16.35-aarch64-apple-darwin.tar.gz"
      sha256 "c92ba965ddd646ffa3b81be11aab31d43630e804bb5e0cd7cdfc2f7170382955"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.35/stryke-v0.16.35-x86_64-apple-darwin.tar.gz"
      sha256 "b7327f3940b5f052fd3925e900cb72774ed58cc370921b029a502a350542424f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.35/stryke-v0.16.35-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.35/stryke-v0.16.35-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0b147615d278ddbd7195ea0786b1441acde2189bc622a9c1bf036b63240f6c4a"
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
