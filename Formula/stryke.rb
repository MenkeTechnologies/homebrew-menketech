class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.51"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.51/stryke-v0.17.51-aarch64-apple-darwin.tar.gz"
      sha256 "46a4b17140b75cec19d68d0dfe0f08960f0e968cadb6112b45b14c7349de1aa0"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.51/stryke-v0.17.51-x86_64-apple-darwin.tar.gz"
      sha256 "7570f050b180436c78c4e13b87a4c66e264f6b413a4e97eb0ecc3bdb8aaf6349"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.51/stryke-v0.17.51-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "36428992905dce7b74c68407d4f4044fb07fa0b959b12bb31323a8245cf7f924"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.51/stryke-v0.17.51-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d22e07c876f062c651630faf83786d539e4152df278dfc5aaf0fdda69bf59fc8"
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
