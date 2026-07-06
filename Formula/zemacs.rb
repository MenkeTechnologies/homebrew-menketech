class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.3.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.3.1/zemacs-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "8709586cb96f3622110b3a78e5d119db2e1aba4e55cca7cfbd75ac718371bc93"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.3.1/zemacs-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "00b6809c5f69374e6c4a58a2775df495beb311e7acf6dbbf80d97eca969fc07e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.3.1/zemacs-v0.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "66d88c3c11347f3cbaf0b802187e09235e3430e0ee8130716adcc137dd84e713"
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
