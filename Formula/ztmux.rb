class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.6"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.6/ztmux-v3.7.6-aarch64-apple-darwin.tar.gz"
      sha256 "3b3c9fbb0d9a9c4dda3113c37c76fd46b822f4e6f9f99e30bb1ad3de28440fa3"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.6/ztmux-v3.7.6-x86_64-apple-darwin.tar.gz"
      sha256 "9d93e1cff8856d2498fde878fed6860494d172662f2d5d3deaefa0b4987e3031"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.6/ztmux-v3.7.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dcbebab3a6798b01fdf61ba184257db118acd9a1de3c826de9ae6812561a7b3a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.6/ztmux-v3.7.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c2947814285e10a19242882247057f6ca247c5dab754bfb5d8793f5476576eda"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
