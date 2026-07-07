class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.5"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.5/zemacs-v0.4.5-aarch64-apple-darwin.tar.gz"
      sha256 "28b1ec9b9f173fff57b7b01db559d8e18ea383c0bc55b32b099f79bff9c46907"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.5/zemacs-v0.4.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ad0940439fe1fbe9377ca13b21b79b9f4a2f08e183a339e0afa5bb1774a00496"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.5/zemacs-v0.4.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "534ce4800740cae1f9f757262d13549ef0b728b24e5e9cb81cb08b7e7778e222"
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
