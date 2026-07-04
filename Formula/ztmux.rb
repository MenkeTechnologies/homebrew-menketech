class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.7"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.7/ztmux-v3.7.7-aarch64-apple-darwin.tar.gz"
      sha256 "508d8f0a1bfb7fedc5bfa647069bed99384ddf779f7fb22004076b4aefaaab1d"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.7/ztmux-v3.7.7-x86_64-apple-darwin.tar.gz"
      sha256 "164176df151adf31d2b8bc346de7027c908772474c2f2fb231960ad6af03e42c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.7/ztmux-v3.7.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6a425bea7973c4ea7d45c58d0f1f8561effb598bce63b2dc5c7780551f18ce7d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.7/ztmux-v3.7.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "82058a48a7d9137f1911b6afe4a291d1c5d6495f5ed55027d37b1108b3445a4c"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
