class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.46"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.46/zmax-v0.4.46-aarch64-apple-darwin.tar.gz"
      sha256 "d9b4cd29ba9ef7ea3114f24890a36c34e24dec373be06d040194a0a7eeb1772d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.46/zmax-v0.4.46-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3abfe9ec241bc916de6fec35ea02a0fe4094c76a7adc45b68ccadb3021745643"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.46/zmax-v0.4.46-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "df6ccc4e71ade1af2f554654a4c43ead3fe3deed6a3ad2b4ba732c8c32eb33c3"
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
