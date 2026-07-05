class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.10"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.10/ztmux-v3.7.10-aarch64-apple-darwin.tar.gz"
      sha256 "825e4bb7517ede38e95f06a65de271d4afb9fbec384b5c2cc52c0fc42f107227"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.10/ztmux-v3.7.10-x86_64-apple-darwin.tar.gz"
      sha256 "9dfb5780b920c62191f8587e25a92ea62cd8b8af5af00603abb80c7cd2f07951"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.10/ztmux-v3.7.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "26284bee170889b167f009f029ab8920627891379728814ff3d2d3f712982012"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.10/ztmux-v3.7.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f9653ac79ca890a170f7d658f2813d26b02fb2d5cc806be708e02f87442d2ea8"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
