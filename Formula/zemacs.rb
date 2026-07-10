class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.9"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.9/zemacs-v0.4.9-aarch64-apple-darwin.tar.gz"
      sha256 "fa158f83f1207d5138f9ac0c39d0c34029956335d9a165f016863472fa16d2e2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.9/zemacs-v0.4.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2460427ea62ce4e2736275df84605419b167c399f3d1956a656c43cc9c71a0f9"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.9/zemacs-v0.4.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "13ae047ff8e2d6402f701e0c0868a8b7c43b4a8ea05576019b95f6dbe9801236"
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
