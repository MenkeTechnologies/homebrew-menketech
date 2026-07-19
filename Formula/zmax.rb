class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.36"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.36/zmax-v0.4.36-aarch64-apple-darwin.tar.gz"
      sha256 "d0a66f7794dfdb3299c637a5eb73faf83cb8e87f007208f2340aacf4d7e60f12"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.36/zmax-v0.4.36-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f0325339b35cbc40c1dc347869b0e7ba4317e7221e04c8b049439e51490a191b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.36/zmax-v0.4.36-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3da2b93d6589e69ee0091464530f4d2a8c18ca5127d3306d88df5bd307be3d12"
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
