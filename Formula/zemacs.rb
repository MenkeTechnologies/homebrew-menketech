class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.2.11"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.11/zemacs-v0.2.11-aarch64-apple-darwin.tar.gz"
      sha256 "591d2e7ba49770d91fd23b574b3aa2449cc5564538ff48d7a5aea89c6c763760"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.11/zemacs-v0.2.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9753f9bc740f4fd5c31dc22a89b016cff9c57e2d9c4f15046a3172cbf21d1b26"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.11/zemacs-v0.2.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "887196b6c7f051a6f5dbf1d307b0a1ed12466f2117aefc37802caecd278fc7ee"
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
