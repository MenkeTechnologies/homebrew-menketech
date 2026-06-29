class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.2.4"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.4/zemacs-v0.2.4-aarch64-apple-darwin.tar.gz"
      sha256 "602012fbaab1ad0db190576d87c35c6b62503498ca2a2f56cc1e4c6ce68011ed"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.4/zemacs-v0.2.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fc155e68ba339718db728b758886976f3325a584eea77c592ff9a71cb5684bd7"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.4/zemacs-v0.2.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "284cfce580137aa7ad483fd28323eac07f0e8a2bbdcc2fd47c8367bc6a3bfc65"
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
