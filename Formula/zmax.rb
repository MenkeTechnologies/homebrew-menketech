class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.65"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.65/zmax-v0.4.65-aarch64-apple-darwin.tar.gz"
      sha256 "dd5969fa13d1061c7e0c1fb0e1da4ac9635451ce4b93c69874b2cc0d8d597ce9"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.65/zmax-v0.4.65-x86_64-apple-darwin.tar.gz"
      sha256 "e996ae505a69436a737a9da7cc3adc986b7c61e2a036e60f2f9f2d464f7c2be3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.65/zmax-v0.4.65-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d593a391a4c6723104b3d81d6b17567ad054377777363d4d699634a21b477cd0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.65/zmax-v0.4.65-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ed7973cf62d441f4a964537d32ac603053c0abf60566536d23b72e00e098b984"
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
