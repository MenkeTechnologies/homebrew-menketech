class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.10"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.10/zemacs-v0.4.10-aarch64-apple-darwin.tar.gz"
      sha256 "4bb6c68a3a960c8bdc140227189cddad9b9d832965095c45b7216265d39f8a45"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.10/zemacs-v0.4.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7220244704d43120c6a0977c23854ee44c9ad5e8dfccc19022bca707674661f9"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.10/zemacs-v0.4.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f1906ad092409ec976b7e5a0edb4a40e08173778c025826ded3364d1e7f49f3c"
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
