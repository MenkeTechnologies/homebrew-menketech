class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.45"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.45/zmax-v0.4.45-aarch64-apple-darwin.tar.gz"
      sha256 "1155b31735d6a1707bf6cbc71ea3bc0d116ac666c53fd21d48a9f102545cb7b4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.45/zmax-v0.4.45-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4138fc31c79a13eb6bda9a02a2d4c1157003a7d4b894e0223d47b2b3d0796b9f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.45/zmax-v0.4.45-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "499c0532f22471fe55021c03235d7fc05a1392ac94a4261a652aa81d76c6009f"
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
