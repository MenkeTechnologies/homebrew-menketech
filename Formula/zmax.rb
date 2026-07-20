class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.37"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.37/zmax-v0.4.37-aarch64-apple-darwin.tar.gz"
      sha256 "19e2bb134b17e38b1650096f3980783bde0a9b8640e4f05d9c1dc3c12426b837"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.37/zmax-v0.4.37-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "70302131603df31bb64fe6424ba6108681604dcc2e513c23134e0b8b3d0a3b62"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.37/zmax-v0.4.37-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "593d40676ed5aff05ae21101b9fa7ac929509defabb634c7fa6b9f33a31b9fdf"
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
