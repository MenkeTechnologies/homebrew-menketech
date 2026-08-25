class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.63"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.63/zmax-v0.4.63-aarch64-apple-darwin.tar.gz"
      sha256 "46550c0f9959851cfef41a749971cfa2d2f531be15233a18f7bc5add8f14d406"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.63/zmax-v0.4.63-x86_64-apple-darwin.tar.gz"
      sha256 "27fdb2b2ca878a27a02e88fffd8dc3d17466d953ba228eb4e5611ab6de2b873c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.63/zmax-v0.4.63-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7d72ed1f57a8f27397ac85d9442388774089980965ff1f7008ce3f8580ffea1e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.63/zmax-v0.4.63-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5e86fd15660006b726785e4e1465e368964c26b394d9206c4594fd038b9a7ce9"
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
