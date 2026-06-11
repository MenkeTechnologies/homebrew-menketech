class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.5"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.5/stryke-v0.17.5-aarch64-apple-darwin.tar.gz"
      sha256 "263061c82d6f46441a55251f0a62ae6758a1a531be6463f0b7b0d3a0eae6bcdb"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.5/stryke-v0.17.5-x86_64-apple-darwin.tar.gz"
      sha256 "dc6a396a10a811f490e80b7125ed1a8869210a7f7b5f779e14524b9ffcee6e73"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.5/stryke-v0.17.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.5/stryke-v0.17.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "27c81fc4b360987022dcb2686be17207fb0b06a8cc5f48176708251e04d83b2e"
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
