class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.14"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.14/zemacs-v0.4.14-aarch64-apple-darwin.tar.gz"
      sha256 "09b12d22e57d2cfa54b7f323be5d5fc6f71b24c34745dbbb5446bc05f43ee8b6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.14/zemacs-v0.4.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2846d8e5f73465393d18683308ea891811d827b1f5aa4c2c725fb6cc798e1f83"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.14/zemacs-v0.4.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c5d4aa431287f08394ddf5c6927daabd1947c058d906f7658099286f139ade3b"
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
