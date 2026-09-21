class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.75"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.75/zmax-v0.4.75-aarch64-apple-darwin.tar.gz"
      sha256 "17f408443dca2c4da6b5d38a10e6fa85547e11b1fd79445cccedee92ab6d9048"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.75/zmax-v0.4.75-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "728cff9cff1740b8d53a146dd5602e7a136e401f768452d9ba04e57344f7a717"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.75/zmax-v0.4.75-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6cee31cf399edcc8f9f72bb74c76d671d06ebd0571b18e79ecdd4d7303eef39e"
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
