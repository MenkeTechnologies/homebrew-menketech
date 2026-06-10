class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.0/stryke-v0.17.0-aarch64-apple-darwin.tar.gz"
      sha256 "0810bfa398a0e4663b167d050a083961e247e70f61d2e9b7a8c4bee66e3e9c63"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.0/stryke-v0.17.0-x86_64-apple-darwin.tar.gz"
      sha256 "aa8e9e6361eadf26c6055fe35a1773b297ecd4c0281593654959af5a1a001ba8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.0/stryke-v0.17.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.0/stryke-v0.17.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1e8fea244660b2b07457c2c1a138b0ea32a602ff3266fbd0e61f78f590fe0adb"
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
