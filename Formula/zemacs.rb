class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.2.10"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.10/zemacs-v0.2.10-aarch64-apple-darwin.tar.gz"
      sha256 "0f2eca95320bc79547f3f365e99bf9869e7e0a795bde77f55e43ecb651a969b9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.10/zemacs-v0.2.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4a8e4f48bd22a01e968b8181afe5a4d985823235390a5de0c1eb1945316b4acd"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.10/zemacs-v0.2.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8d15bf5f59631733dda34f4fbbd0135bd5873f4c5206990d79c8b87e4c25acf7"
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
