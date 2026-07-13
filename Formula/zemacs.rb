class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.19"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.19/zemacs-v0.4.19-aarch64-apple-darwin.tar.gz"
      sha256 "07cd0233f8f13949353f5f946231cbf97af90f0d2ee7e7485e83d1ffd75b032f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.19/zemacs-v0.4.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "615945b2f42a44a50f44cae95b05e01228a5bbd97b842afe523497451c8281cc"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.19/zemacs-v0.4.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "61c278c0836378d2aaf2bb6b9e541f322f403a87479570b7cce0a34dd2fbd44b"
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
