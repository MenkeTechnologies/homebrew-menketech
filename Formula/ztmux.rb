class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.17"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.17/ztmux-v3.7.17-aarch64-apple-darwin.tar.gz"
      sha256 "ccf614a04d3c9053c5260a3eeef6fa1ccb59a3ffea1ce8ce6077efb962852134"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.17/ztmux-v3.7.17-x86_64-apple-darwin.tar.gz"
      sha256 "ae0e779dbfba134073afeb65ceabd3c4fc988f357315bd46c776b340bc90ef18"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.17/ztmux-v3.7.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "937dbd118ba01f5a4b1fb215c29860e0820d6d65dea3d8ad701f733ec64aea1f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.17/ztmux-v3.7.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b4b6c2e9b1d98279ad75a8b136f2104599701e3c04f450f21ae45ffb079b8e42"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
