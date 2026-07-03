class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.2.16"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.16/zemacs-v0.2.16-aarch64-apple-darwin.tar.gz"
      sha256 "dd5c29828a40b5e1541ecb2a0a6a9554fa2f28753a027dd903381c87604b9079"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.16/zemacs-v0.2.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bc37b75bf16732aaa4122930cffb55feb9211c0acaa9a1c5373856fcb79784cb"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.16/zemacs-v0.2.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "529cb56b40eb26fb2f8bc64837b5eacac034513b113537e798f87de6dcef7d02"
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
