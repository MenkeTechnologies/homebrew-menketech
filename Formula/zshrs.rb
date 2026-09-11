class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.63"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.63/zshrs-v0.12.63-aarch64-apple-darwin.tar.gz"
      sha256 "e3eb669c061554eadceb697b1f9da64733dd10ad376df3b3028be2212b057855"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.63/zshrs-v0.12.63-x86_64-apple-darwin.tar.gz"
      sha256 "bea755e6796491fcdc9ed4bfbd3bcb409acd95460f63fd8a7942db148beb5565"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.63/zshrs-v0.12.63-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4e459e24a78204dd8df5c28c64752fb1fd11374662095c2831be4d5443eca3b0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.63/zshrs-v0.12.63-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0674008ebd910f5cc606ad113d2b14cb15036314dd493a1cf95303d7f45e02c5"
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
  #   zshrs-v0.12.63-x86_64-unknown-linux-musl.tar.gz  sha256: c731d830b9000fe8ae17d5bed7a386b6698666470593e2d62b8e518581f95a6a
  #   zshrs-v0.12.63-aarch64-unknown-linux-musl.tar.gz  sha256: 68627e52fcf93e583a9b3c419a167ee4525b532cf44192a4a5badb84b6474002
end
