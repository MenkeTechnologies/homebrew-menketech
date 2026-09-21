class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.76"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.76/zmax-v0.4.76-aarch64-apple-darwin.tar.gz"
      sha256 "faf614824acd39481cd2f8653da7bb7a1410e5a38957b1682de61bdea69603a4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.76/zmax-v0.4.76-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "288af4d518a8d0bdc2ffbfd9123ead6e1479bc1f6459a9a8356d320eeda60f74"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.76/zmax-v0.4.76-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4193066c79f5562b015c20e91e4511bf19adb53f916f46a5bfc2b482888d2666"
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
