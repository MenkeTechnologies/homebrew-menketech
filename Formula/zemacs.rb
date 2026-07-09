class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.8"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.8/zemacs-v0.4.8-aarch64-apple-darwin.tar.gz"
      sha256 "c8b304cf19b1b13accacfa1cf1122a09f620abd76f0cc96c605e56753e0be9e1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.8/zemacs-v0.4.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c0c556cba80e4f5850cd04292fb68a2b20bc89f30f3d8bd266eedb8c33af4bdc"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.8/zemacs-v0.4.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c9836012b5cef0ade923a9995e77567c9115db643ad04fe4961b9e27359b4854"
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
