class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.69"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.69/zmax-v0.4.69-aarch64-apple-darwin.tar.gz"
      sha256 "5ecfe52006888e4733c999c90e0dedc6bd1324653ecd8c52bff2c35f2494a496"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.69/zmax-v0.4.69-x86_64-apple-darwin.tar.gz"
      sha256 "28f836a0f50080f20b1e3da307c70bb0816119a0b25cf1d6f03893effecb6abe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.69/zmax-v0.4.69-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1ebfa4f47cc71177c13cea2cf667f2b6bdee45847ce7a5ea8f94c3922cdb5bf6"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.69/zmax-v0.4.69-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8a6e7015492ff4e50928e811b11ce7aa8029549cde2b7a1fc129b08adda4b5b8"
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
