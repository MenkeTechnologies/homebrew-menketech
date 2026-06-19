class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.14"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.14/stryke-v0.17.14-aarch64-apple-darwin.tar.gz"
      sha256 "730eac6edeafe460d656a611b6e0a56ee800f2465c6492c721d8e752a86694db"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.14/stryke-v0.17.14-x86_64-apple-darwin.tar.gz"
      sha256 "ab48f8f859cedde7740d2dab6d612e4426ae6b3aca45152768175303ac089e84"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.14/stryke-v0.17.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.14/stryke-v0.17.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0afadf28064113fd1467b69640a69585458726bff2ef3813e468df9d02f5b439"
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
