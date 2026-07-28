class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.29"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.29/ztmux-v3.7.29-aarch64-apple-darwin.tar.gz"
      sha256 "cd2b00f309f7a96f180a59932680fc54c5b4c181a1091b74f6c737bb88dba8d2"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.29/ztmux-v3.7.29-x86_64-apple-darwin.tar.gz"
      sha256 "69548656cae67aa0629e9cd6eff2d53381603c8da923bb3132a1ac05abee11c2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.29/ztmux-v3.7.29-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7da62abc3ab2e500dcd79e59bdc3f1250c5a9dfeb0f9c7a4dfdb6fd0e08d4192"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.29/ztmux-v3.7.29-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2efbb09dd5d901eb51919b45ba405a43b69154aa7e7726e4e511dc508688cd24"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
