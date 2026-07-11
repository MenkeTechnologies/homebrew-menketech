class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.12"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.12/zemacs-v0.4.12-aarch64-apple-darwin.tar.gz"
      sha256 "66b3ac0d6b2adb7d34444579fd28d8bdff483353f453ac4c331b7f2e1139f89d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.12/zemacs-v0.4.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "32879b3bf116dbc92e244e78da643839ce79cd255a5c026675816ab9da11ede5"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.12/zemacs-v0.4.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "131c69aee00ddd6fad6304f6839200a4b9184f8350b32bff35bc0162f00dd5bf"
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
