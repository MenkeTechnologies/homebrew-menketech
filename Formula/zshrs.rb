class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.85"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.85/zshrs-v0.13.85-aarch64-apple-darwin.tar.gz"
      sha256 "4758ab467e5fdf08798ca6bf5cf69c00096f50fba2952cb14f967638b1b3f28a"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.85/zshrs-v0.13.85-x86_64-apple-darwin.tar.gz"
      sha256 "25be6f9dc526b0aab71e72cb29038ac39f56f0cce1b9ce8f028d9a4279aa9423"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.85/zshrs-v0.13.85-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "47c146745b3a6418ded485e0993aa9108b8665afab93f339f8171baa1ae888eb"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.85/zshrs-v0.13.85-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e372addb97bb1baafb5092565f3f3d124fa3746b714dada030d4153d912a4b26"
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
  #   zshrs-v0.13.85-x86_64-unknown-linux-musl.tar.gz  sha256: 7fa354bd7bce5133d1d28c25ce2d588d606a559d90073d223671d4932e77f220
  #   zshrs-v0.13.85-aarch64-unknown-linux-musl.tar.gz  sha256: 6bb6e341c71e708be1300033531f90b81126bb99c2c23aa228b0f8d02d5a00a9
end
