class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.16.6"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.6/stryke-v0.16.6-aarch64-apple-darwin.tar.gz"
      sha256 "1a2a3f118de1b7636dfda81121c92cd50995eb29fed6d1b7bd259831ca7853f9"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.6/stryke-v0.16.6-x86_64-apple-darwin.tar.gz"
      sha256 "3eb2e5aa7283e9d86eee0e8d2aa9c73b419b419bc85316ec2ba4f80194c2d5e2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.6/stryke-v0.16.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.6/stryke-v0.16.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "421187aaf7a52285f3f5238b9826d5b667d8bf79dc92c4b1b050ad2b11bfface"
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
