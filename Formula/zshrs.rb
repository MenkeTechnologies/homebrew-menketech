class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.49"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.49/zshrs-v0.12.49-aarch64-apple-darwin.tar.gz"
      sha256 "4223e14fff70369cf396b09b3b05b96cfbe5bac88e64b3b4d110a117cfd7e0fd"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.49/zshrs-v0.12.49-x86_64-apple-darwin.tar.gz"
      sha256 "07cc4bd83a981b737e1262d0492a1f1126dd794179b585a955ef64a7f55d7e4d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.49/zshrs-v0.12.49-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e8aab993c0e939e408d6ac47f1c37c14f71f36fea6d9c468551fa7d18a7a804"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.49/zshrs-v0.12.49-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7e723c24bbb85aa64e4769d1e62a53d70fb77effe74f0fa4e0aac1f674bf3732"
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
  #   zshrs-v0.12.49-x86_64-unknown-linux-musl.tar.gz  sha256: 62bd7a2d44737691d040a91faff46ee1092e5545a54262e4c771b905306e4746
  #   zshrs-v0.12.49-aarch64-unknown-linux-musl.tar.gz  sha256: bb94140434b116e593f30faa60d823771036396612e5a5a722474f96e87a5d28
end
