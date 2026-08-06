class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.37"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.37/ztmux-v3.7.37-aarch64-apple-darwin.tar.gz"
      sha256 "49726bba646e4bb05c29791f523a1e084184e4a3f7745e5d94e0d6b9949ed7a4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.37/ztmux-v3.7.37-x86_64-apple-darwin.tar.gz"
      sha256 "aa4dff84e8ab3414f83b0b012044d77b167c3c1b91ec7607fae6048b5a81190a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.37/ztmux-v3.7.37-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "000eff210ebc2bb9b4bcf114b87c3d387d0c51c23700f95e7865ad33b149e45e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.37/ztmux-v3.7.37-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7ba6499974792e6c89461174029303b37f679ff448b008c1376b09244a28d916"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
