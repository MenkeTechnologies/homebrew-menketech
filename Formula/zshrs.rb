class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.75"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.75/zshrs-v0.13.75-aarch64-apple-darwin.tar.gz"
      sha256 "131c7d0c9e6d0247c8e2f704ed946adbf7541e79fa2429a0e2eb69b059558e03"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.75/zshrs-v0.13.75-x86_64-apple-darwin.tar.gz"
      sha256 "5a2f8acad795e1473d3fa851c2090547339ae43fe07ed69f09e52ffb09f0be16"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.75/zshrs-v0.13.75-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a0135d2b5a33ff5882983c83ececb02dad1d0af802ae4d424d5be60dce01f982"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.75/zshrs-v0.13.75-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0b6b4aeadc729809095c3d71b0464a9b132f1c49442046cd6ca5b8bc573093af"
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
  #   zshrs-v0.13.75-x86_64-unknown-linux-musl.tar.gz  sha256: 357a5e3ecd127e2c253e9701fe4bcc7edbf7e1eea5564333a6e4fcb474cc8c0b
end
