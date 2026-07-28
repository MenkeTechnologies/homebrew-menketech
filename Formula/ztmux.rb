class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.24"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.24/ztmux-v3.7.24-aarch64-apple-darwin.tar.gz"
      sha256 "016248b257fe8f63c1889ad91b2cd5f422b88c3d835b838a3b4994f9ea367e0b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.24/ztmux-v3.7.24-x86_64-apple-darwin.tar.gz"
      sha256 "37ab5ac848bc5d810a6f48b6d9e03db6ce46efa1195694374c7961ac66038454"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.24/ztmux-v3.7.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c9c7bb52dc46234ca9cfe58e75e9a3350c79922dcf98cc94cf13395f66d64678"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.24/ztmux-v3.7.24-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "348f62ac4987de86f0ad014fe0373125efdc65dd1ca45ced181b753ed4765655"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
