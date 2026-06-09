class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.16.38"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.38/stryke-v0.16.38-aarch64-apple-darwin.tar.gz"
      sha256 "0f3c8ce3088418b2fee222e526b7119ef68a847302cf598e0121b156573a9ff0"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.38/stryke-v0.16.38-x86_64-apple-darwin.tar.gz"
      sha256 "54c88a4decf2615c87b7aea76d8b94cbaf0cf948b6d9219161a9fd606531dfba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.38/stryke-v0.16.38-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.38/stryke-v0.16.38-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bbd578a58f699934a868404d21baeafe8711fe9d3ab7090532d70dbb8dda7b4e"
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
