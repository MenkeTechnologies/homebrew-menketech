class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.18"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.18/zemacs-v0.4.18-aarch64-apple-darwin.tar.gz"
      sha256 "99937fc4269e927f86ea204913935f572dfb088e332641ea424c5ebf8c7a9690"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.18/zemacs-v0.4.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4e6f9184cd4f88bc1e4dca25995055d78a7994d923b4a23594a8c394d8f8934b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.18/zemacs-v0.4.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a98288f3afb2f368ab7eb9a3cd93411ba8bf20855b4ed3937548feb969d82e85"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"zemacs"
  end

  test do
    assert_match "zemacs", shell_output("#{bin}/zemacs --version")
  end
end
