class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.17"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.17/zshrs-v0.13.17-aarch64-apple-darwin.tar.gz"
      sha256 "fcd07399f9085ae1c425ec05eb0fb6bc844aeffcee8d29dfc6b75eb0c8da6cae"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.17/zshrs-v0.13.17-x86_64-apple-darwin.tar.gz"
      sha256 "9a3c88bb5fa2fd8a7534695bc5b94a7ae8ea07adcac099c6aff5e9d56e56e947"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.17/zshrs-v0.13.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aa2980ec7cce7b0326d0892589eee0e9f403cf06eb6e218a76e403b07765264b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.17/zshrs-v0.13.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dc843d5dacd8048744b21406a1cb276c43f4e40424a2b2392a1078c1663033de"
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
  #   zshrs-v0.13.17-x86_64-unknown-linux-musl.tar.gz  sha256: efc441082a921de65807332b35ea3681a3f9ed34316df6268fe8649cae813d0d
  #   zshrs-v0.13.17-aarch64-unknown-linux-musl.tar.gz  sha256: b1b4bea5f2cf4336c03f2e740fdfea4df28857b2f1ed9af5d874162a41ef7059
end
