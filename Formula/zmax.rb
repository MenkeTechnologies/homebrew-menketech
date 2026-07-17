class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.32"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.32/zmax-v0.4.32-aarch64-apple-darwin.tar.gz"
      sha256 "266e214ca655bdeb6c31ce34458403968107163ae2809ad8a7fbd2c96d159b41"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.32/zmax-v0.4.32-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ed6b077085b456fe75b456099878040325b9d0a24daeae8264a8f71e70ddec6b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.32/zmax-v0.4.32-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6d1d8a0fa099ecd9fed67d68b7194957c6d7b7016a5277d8378e2f9879ba21f8"
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
