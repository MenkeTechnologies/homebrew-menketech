class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.71"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.71/zmax-v0.4.71-aarch64-apple-darwin.tar.gz"
      sha256 "99fec90d691d1b92f292964b3a4c84bda032da10a7566b7d2f45a1e5aa3a0939"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.71/zmax-v0.4.71-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "96a22c6de0b8e77ad691f0e36bd37cac47789f16e607613a124dc414fe49cad8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.71/zmax-v0.4.71-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "40c7f3a3a62fd16093d6178f068b55e140256f6e07f4c1bbf7f27d9a298d08e1"
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
