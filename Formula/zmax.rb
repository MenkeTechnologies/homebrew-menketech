class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.34"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.34/zmax-v0.4.34-aarch64-apple-darwin.tar.gz"
      sha256 "178563cab29b20b666b7d13075f522a9640d0ced20a2e24acadb12fa862493ea"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.34/zmax-v0.4.34-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2768e0df70383366eeb7dfad858ed994bb02ea59b51f3efea2f4a9ad53ac3fd4"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.34/zmax-v0.4.34-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f68f39c62a0fe900b1c28862c4af8218219e2c5c2f7d9b79e1cba5d18afae1ed"
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
