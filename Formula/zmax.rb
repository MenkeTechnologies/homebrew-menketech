class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.62"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.62/zmax-v0.4.62-aarch64-apple-darwin.tar.gz"
      sha256 "48b7f510479c0f62dabe4d0acbde13a383d2a0ad92744b981c8326e87c8f155e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.62/zmax-v0.4.62-x86_64-apple-darwin.tar.gz"
      sha256 "d0368da3a1e5d73f44ae618f773469ba040e4e9577c0590d5dcbb867b6d0deea"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.62/zmax-v0.4.62-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "edfc71afc0427a0e936d7a83388061b564e1671c5387b85b75928961c6f26480"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.62/zmax-v0.4.62-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5a30cf925909af7f89ea6f01135cba2f142dd8e5efdb87a60d653ab5695be42a"
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
