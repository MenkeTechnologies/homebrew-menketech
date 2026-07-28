class Ztmux < Formula
  desc "Rust port of tmux — the full terminal multiplexer, server and client"
  homepage "https://github.com/MenkeTechnologies/ztmux"
  license "MIT"
  version "3.7.30"

  depends_on "libevent"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.30/ztmux-v3.7.30-aarch64-apple-darwin.tar.gz"
      sha256 "27a9f6715e25d743ae0f0f12f9be393c0973d20d9cbc15f3a8bee9cad8694482"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.30/ztmux-v3.7.30-x86_64-apple-darwin.tar.gz"
      sha256 "528315d33b3df36a85a13dd6b389a55f9bb095ac1185a6f851d39d9212f4281a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.30/ztmux-v3.7.30-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "76d91b169643a8663d2d2022ebb78271d3274fa2b864a1969ec5668cfad411e8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/ztmux/releases/download/v3.7.30/ztmux-v3.7.30-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "604f4391dba9ede93bc79b80fa1646e64c3d1a0293fae10b95fc3243021ca102"
    end
  end

  def install
    bin.install "ztmux"
  end

  test do
    assert_match "ztmux", shell_output("#{bin}/ztmux -V")
  end
end
