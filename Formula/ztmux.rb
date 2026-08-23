class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.44"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.44/ztmux-v3.7.44-aarch64-apple-darwin.tar.gz"
      sha256 "d11b7707e694993df6280961afecc1fc877187db28d750cdb53b0685cfe8d960"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.44/ztmux-v3.7.44-x86_64-apple-darwin.tar.gz"
      sha256 "d47338403ed187573e2f4caf37bf84bba056aa549bdf4beb05386df99a43b844"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.44/ztmux-v3.7.44-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5336b5ad4be0adee6f0a61f52d6753bab23c9dd5954c7fe9d758861e64c53d4b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.44/ztmux-v3.7.44-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d3fd264ef8b34d80af5b7c842a54a1839c84eebb518583a0cd2b62fe7b0af3a2"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
