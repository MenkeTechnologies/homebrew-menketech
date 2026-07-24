class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.40"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.40/zmax-v0.4.40-aarch64-apple-darwin.tar.gz"
      sha256 "2678664920ea1dfed5d620519a21af04b0b7052e34f04e8dc98c7056a2eb578d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.40/zmax-v0.4.40-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "199f7e5255435a3ed8de5316de32452747467d699591dc09fe375777a7b9a7f6"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.40/zmax-v0.4.40-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "513b5002001430f3ad8b845d55cf98f60038ea76220e1df0e49a5e55783c51a1"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"zmax"
  end

  test do
    assert_match "zmax", shell_output("#{bin}/zmax --version")
  end
end
