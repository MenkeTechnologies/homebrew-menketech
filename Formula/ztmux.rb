class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.25"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.25/ztmux-v3.7.25-aarch64-apple-darwin.tar.gz"
      sha256 "7a222f9a915df3b9edc52e56d45a2808afda6578477eca6d39e1973e4aa38207"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.25/ztmux-v3.7.25-x86_64-apple-darwin.tar.gz"
      sha256 "fc71b8995b92b43fb5a99aa7c4e1329287b188e44f9ed0d3cb73451381e66a17"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.25/ztmux-v3.7.25-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0337732e63adb7fb55240d635360cfaa7cc5af5f1a4f92297a59fb08d3a6304f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.25/ztmux-v3.7.25-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e160a58f40fb7d8977594686cb5d4b1f1cdf03ff6ce6bb847c2e6d26b19d2ad6"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
