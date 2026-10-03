class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.70"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.70/zshrs-v0.12.70-aarch64-apple-darwin.tar.gz"
      sha256 "e3fca7416a4c236ed842cc7afc394117941de89e6e70be54afa8b2a90829ce6e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.70/zshrs-v0.12.70-x86_64-apple-darwin.tar.gz"
      sha256 "a078764c9065cf041997be07295ed7aee7bcbdf3fbf47681c50db6eb59272040"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.70/zshrs-v0.12.70-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5eaa55eb0cf3d28d9f98078f05f8b3c6d2f1a7698b1c6516a1b786fff3440f0b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.70/zshrs-v0.12.70-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cbb5f0b49d794b6683411019a07d571b11559d486489531d827150b3fbc823d0"
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
  #   zshrs-v0.12.70-x86_64-unknown-linux-musl.tar.gz  sha256: 3dc1e5b6c483797171de027d24f3de686ecfb531466ec9294d0fb5ee537b5385
  #   zshrs-v0.12.70-aarch64-unknown-linux-musl.tar.gz  sha256: 842de5fcf6f1df16bd3177bc7935066d6fa8217bdc89c27f8676101525ea638d
end
