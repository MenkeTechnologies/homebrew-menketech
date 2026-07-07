class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.4"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.4/zemacs-v0.4.4-aarch64-apple-darwin.tar.gz"
      sha256 "d4b796dfdc9c3d9955395ebbb9892195f37b7b5ba859c5355885c92869744579"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.4/zemacs-v0.4.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4f9c76927c6262ce8877a9d0223aea38c3dacd59c8533e995b10eaf78f17ea8b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.4/zemacs-v0.4.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f87fe894e62ec88ca8a8b3fee0266f5dc0c6fc9b833d168d62ed2836d22685e0"
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
