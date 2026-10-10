class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.26"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.26/zshrs-v0.13.26-aarch64-apple-darwin.tar.gz"
      sha256 "74c7df4e18a89cc7d62f8869d7b0298de97790c0fe9c8dddf956be73a382f43c"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.26/zshrs-v0.13.26-x86_64-apple-darwin.tar.gz"
      sha256 "07db6aefe774860213fe9b640d5e1d431468703995fed87871eb4807ec6ba4b2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.26/zshrs-v0.13.26-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "192ed6ad2ff0dee9191cbc636515fd3263b7291a6aa71eb318809fef8513bd33"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.26/zshrs-v0.13.26-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2058d9c6f2119fc6b702d8695f4049f3ab31eb420ead1bdf43818cf05ffe34a0"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-v0.13.26-x86_64-unknown-linux-musl.tar.gz  sha256: 7e04a65a093335447900a26c1329e4c0185ed5c97384d4454c3634e72777a5f8
end
