class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.5"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.5/ztmux-v3.7.5-aarch64-apple-darwin.tar.gz"
      sha256 "19c36a42748f141791272d87af969b6da7edd5c085c7bc62dd8bf2e1eb831931"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.5/ztmux-v3.7.5-x86_64-apple-darwin.tar.gz"
      sha256 "34faac3d80353b853bb0a343991b57b640003fbddcbc43101eb1d493e233b981"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.5/ztmux-v3.7.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "828ae37cd6154d6befe5f79ecf2c0231dd3ab2440c6f81b3c3a54555289e8e9a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.5/ztmux-v3.7.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d4f71acce62bc5dff4246fa2a54652c2883385957f5958ba7e5472a5d3ede1b3"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
