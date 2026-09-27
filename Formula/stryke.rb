class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.57"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.57/stryke-v0.17.57-aarch64-apple-darwin.tar.gz"
      sha256 "cff5ecbd7c7716d901c35d83ebe913197735a780831d7ea3abb477d6c37a0086"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.57/stryke-v0.17.57-x86_64-apple-darwin.tar.gz"
      sha256 "6ed7ec00dd67077167db688e6862e46b8fa4a719bb768f3b6af3e7126c02c607"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.57/stryke-v0.17.57-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b32eb84bd876a5b13b1064f353e0e1b434d0258886a656a03253e072ef99d2c2"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.57/stryke-v0.17.57-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c408f6eaa5e0089f47f212d9a120f0e6c6d15d9488cb207c6fb4d1df90e1375b"
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
