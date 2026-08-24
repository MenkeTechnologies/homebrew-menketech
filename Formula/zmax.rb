class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.61"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.61/zmax-v0.4.61-aarch64-apple-darwin.tar.gz"
      sha256 "fa569f6142d42200cc0c14b96099f5dab648f447fe968332a25e1800f5a402f8"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.61/zmax-v0.4.61-x86_64-apple-darwin.tar.gz"
      sha256 "d92b98f7ac257b0c5a1cd8189723701e50300c6ddec2573fed7acd6cc38ce18b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.61/zmax-v0.4.61-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1f8b75813e70aded54517cd9d9afef980a737b34b83d3c1224dfdf9a0010e2e0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.61/zmax-v0.4.61-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "66d0a5657937a31b97d1edbc546b48460073f290f7bf185bef8e753e1c9220dd"
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
