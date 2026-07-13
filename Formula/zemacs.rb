class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.21"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.21/zemacs-v0.4.21-aarch64-apple-darwin.tar.gz"
      sha256 "024ee6bcaf6306ab7d1c30fd02fb9eab97dd7a40f466c7767c3a2202e2ac31d3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.21/zemacs-v0.4.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1b0b71ba2f10007cb9c8dfa99a79eb045a1e6c77b95fef666bbec65027492d4c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.21/zemacs-v0.4.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "41a771d7f30221f86839ee9c29cf7d6dcabcf8e40f99b44571edf6bd603c2bb9"
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
