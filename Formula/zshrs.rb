class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.83"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.83/zshrs-v0.13.83-aarch64-apple-darwin.tar.gz"
      sha256 "6fb341b79419d88ebabd37b156374dcb4f899325bcd4d15d8393378e3d34c314"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.83/zshrs-v0.13.83-x86_64-apple-darwin.tar.gz"
      sha256 "cb6962eca42b8be0f92664f30e90d619f4ad6a740e202d01ea96be8622d84e8d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.83/zshrs-v0.13.83-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2d7626b53643bb4c68dc219572b6527a052d76e5ae084658787977945339ddde"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.83/zshrs-v0.13.83-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cb572591e5da49763df2bbb0637bf7da9f264010caf0a20a999666b7dbc433ed"
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
  #   zshrs-v0.13.83-x86_64-unknown-linux-musl.tar.gz  sha256: 65cbff210b998226673485b8ebc10bedf2ce21245dd2dd7da32c213faefe56a1
  #   zshrs-v0.13.83-aarch64-unknown-linux-musl.tar.gz  sha256: b3b06e3ff3e30e24ccb80d6ef08b442977640fa05635b53387c49b827f7bf376
end
