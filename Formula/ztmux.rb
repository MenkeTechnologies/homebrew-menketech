class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.18"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.18/ztmux-v3.7.18-aarch64-apple-darwin.tar.gz"
      sha256 "e2378c0323439241cfe9a8b95c1f71977db682f112440e428fc89f32aa2c66f4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.18/ztmux-v3.7.18-x86_64-apple-darwin.tar.gz"
      sha256 "5bd57ca8b6c4a9f90fe241b1648e39c28d2252b09cb435b67a309aab310bf5a0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.18/ztmux-v3.7.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "245a6cf4099190199155b13fd334f0865c5412a19b6e89df268fc405e334005e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.18/ztmux-v3.7.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "675a8050fc141429b8c628220e027c97fd06edc7747960763b9bde696dc2d1b6"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
