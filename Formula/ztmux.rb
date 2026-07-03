class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.3"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.3/ztmux-v3.7.3-aarch64-apple-darwin.tar.gz"
      sha256 "a95acceb8aa2a50db7ec5dcef91d4b610a7e7274fa3580f92ca9ba3c094abeb8"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.3/ztmux-v3.7.3-x86_64-apple-darwin.tar.gz"
      sha256 "5f6531eb080ee8c5d3208e679d15d48f6b4c17b2aea2549617209b109983d942"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.3/ztmux-v3.7.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1c8f3a2b1cd909299512a6008093bf1707224f2bbc8a793dbb7f2e5115666a98"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.3/ztmux-v3.7.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "23f3ed75cb0aab35a32ac1a2edfcd65c95f99f44178ad98da336d9333fbbed64"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
