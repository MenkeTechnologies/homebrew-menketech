class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.11"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.11/stryke-v0.17.11-aarch64-apple-darwin.tar.gz"
      sha256 "43f49a7c8a56881cf0a351e1b8a93a6cee5316d7aaaf26c75ac7eecbffd012ef"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.11/stryke-v0.17.11-x86_64-apple-darwin.tar.gz"
      sha256 "64a2be1da00bf460465df6beab11d0372b21db1f31f0523fc6e5e1a2049c1a23"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.11/stryke-v0.17.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.11/stryke-v0.17.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "152e6b417afc1c9b9625226de01eb1ce09c3ece212d5c537f61b67a69c865ca1"
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
