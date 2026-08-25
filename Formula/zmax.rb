class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.64"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.64/zmax-v0.4.64-aarch64-apple-darwin.tar.gz"
      sha256 "5f72a0196494b93149bb75f266ae3080f571ed58a8f5a24fde25c8083cbd4e26"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.64/zmax-v0.4.64-x86_64-apple-darwin.tar.gz"
      sha256 "38b5d4e48d10b11cead9fefe8ccfb8a85af187d33b2e26c642a837f7d51f0dcd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.64/zmax-v0.4.64-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7c2c24f3d3b3c3596a3571bbbd140492ad599ce1def8179beb880ba44982f42d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.64/zmax-v0.4.64-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d1e5f101a52b9217996af2c1d15ce784ae136f966be8da3bf54c386b77cd30a3"
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
