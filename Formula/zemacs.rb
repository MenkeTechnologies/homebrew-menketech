class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.2.7"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.7/zemacs-v0.2.7-aarch64-apple-darwin.tar.gz"
      sha256 "b6134e798b9082409aff140a21d1ffcd884ea505588b608ed18ba30da57d5525"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.7/zemacs-v0.2.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d87ff179f5cc67c527bd26cd43efe1fb981174de278c255a34f5863bf4754669"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.7/zemacs-v0.2.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ca8a1f2224ed5aa016dba8785b66ee5aec623d6d57a49310f970863bd526aaf9"
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
