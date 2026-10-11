class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.48"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.48/ztmux-v3.7.48-aarch64-apple-darwin.tar.gz"
      sha256 "cc5f55e93b08b4d25163df6ad620b0af852085d67bf818accc5b8c2308f8f55e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.48/ztmux-v3.7.48-x86_64-apple-darwin.tar.gz"
      sha256 "b51454357f8ac8f778e3def31cc917fecb0c21cfa1b25ecd703c591268643e0a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.48/ztmux-v3.7.48-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "de1db8b20e43178dfdc64baa62598293973fa6cc9de07674510001ba6bfaa928"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.48/ztmux-v3.7.48-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "39a9c4fe4cb7b2cb12aa871db87b7b7b3f7877eaacc927947d6a13eb72fe7e49"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
