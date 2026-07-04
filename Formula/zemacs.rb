class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.2.19"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.19/zemacs-v0.2.19-aarch64-apple-darwin.tar.gz"
      sha256 "ef4485855811a62c698a6ff7dffbeadac03ff78cfe8a8681b7c2494399bcb942"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.19/zemacs-v0.2.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "35fe3dcae2cf27c5fce59869c998b04a89a40c855d1a943d770f3f19bd995eb9"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.19/zemacs-v0.2.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5bee1a336d13802850545a1d946a753759b5f96484635c61639fc3dab15df48b"
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
