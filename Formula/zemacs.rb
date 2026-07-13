class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.26"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.26/zemacs-v0.4.26-aarch64-apple-darwin.tar.gz"
      sha256 "16efc1cbd36e5cf20fcc7dfb6a64036635552532a86381abe56bc3c75db1e2fa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.26/zemacs-v0.4.26-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b50ba1a74782806ef52ae07edb8f3f8a59471b2bd70bfafeaee10e540cb07d82"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.26/zemacs-v0.4.26-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "805ee4a9d08be49d1cd9d8813442bcc84521c3f1b157ca3d093a37da9620c7ac"
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
