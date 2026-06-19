class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.13"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.13/stryke-v0.17.13-aarch64-apple-darwin.tar.gz"
      sha256 "39f1332f648d6812ff0ac9e7f2760c48561cef5c82a8b8d98edf65607c11a2aa"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.13/stryke-v0.17.13-x86_64-apple-darwin.tar.gz"
      sha256 "3dcaa64c49bcf5ebc23945d799b2da12bed81fd4837e48dc75f51e685c939e65"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.13/stryke-v0.17.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.13/stryke-v0.17.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8166039d6ad98a0ecdab57e34762502c851199b013c1e15996369365a4c937a8"
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
