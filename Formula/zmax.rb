class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.48"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.48/zmax-v0.4.48-aarch64-apple-darwin.tar.gz"
      sha256 "182ee2cc38ded814ba7ad52b404a08fc128e40e22e6402e89d8d6d444fe7f9a7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.48/zmax-v0.4.48-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e504a531194b1208c4c43feb90c542c19e36c9195259cf9341033a1950caf5df"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.48/zmax-v0.4.48-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "798670106ab8b7a31eb27d336c5b3b68feb2f208165f625fbd662ef6fa4c148a"
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
