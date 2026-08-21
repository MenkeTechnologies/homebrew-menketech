class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.41"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.41/ztmux-v3.7.41-aarch64-apple-darwin.tar.gz"
      sha256 "bb02f3b71a55551f48bbf6a8c93d5ceef7e0629009ad6cf62658e673cc65a389"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.41/ztmux-v3.7.41-x86_64-apple-darwin.tar.gz"
      sha256 "6a9c90f357923ebebd82f296aa06e418ed5f29674513bafeef0a66f43c0b0736"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.41/ztmux-v3.7.41-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b5fecce75bb296445773a22d4d2d86fc2700c2e59ea5c7cb2b956a7bd6e8bb32"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.41/ztmux-v3.7.41-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d3f27c2d86c0c429ab466d4ae3435a66132a79ed8f9b9546b7d2a134c2b55375"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
