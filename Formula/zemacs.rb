class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.2.15"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.15/zemacs-v0.2.15-aarch64-apple-darwin.tar.gz"
      sha256 "6c9ded8a27211fcb26c1449186329a339d620392fff147673841ab9b0dfddc11"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.15/zemacs-v0.2.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f7f85e13b8bed1e9a9ff9c3898efe07fed8eb33a18225a19dd9f10efaf1a0a20"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.15/zemacs-v0.2.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c519fecd414aa8bcc53f0653b5e317fe470728cd049a6c89444b83c325750539"
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
