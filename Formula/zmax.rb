class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.70"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.70/zmax-v0.4.70-aarch64-apple-darwin.tar.gz"
      sha256 "2b894a13b7a10f8c6478a0c95b82cfca87a25fefd2c76c27e794511d92db152d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.70/zmax-v0.4.70-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "53e4da7e2c86a7d598eff3aa499e8abbe6c00bdd4d468f448edbd4b6b72e8ffd"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.70/zmax-v0.4.70-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ee4b10d1688379f04e18530719da4db32b512d1b55865f4ca72770322613373b"
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
