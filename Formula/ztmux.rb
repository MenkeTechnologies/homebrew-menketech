class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.26"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.26/ztmux-v3.7.26-aarch64-apple-darwin.tar.gz"
      sha256 "f5fc9854cd12b8d0e08181551bf28d844aa55a4a8fb0340ce8c6c0b90137a081"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.26/ztmux-v3.7.26-x86_64-apple-darwin.tar.gz"
      sha256 "6ddd5eac44a837634044c38362f0a3c663e2ac0cb23c47aae55f030067dda09b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.26/ztmux-v3.7.26-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dbbd4c7541d828b7692d30381eb351bfa830ac6bccb2a390f24d25edc9d1812f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.26/ztmux-v3.7.26-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3e6c736c6c2966bfcc50eeadb6be51bfac376f5b4f3f95a8464deb45569bbcd8"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
