class Vimlrs < Formula
  desc "Vimscript (VimL) interpreter in Rust, ported from Neovim's C eval engine"
  homepage "https://github.com/MenkeTechnologies/vimlrs"
  license "MIT"
  version "0.2.5"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.5/vimlrs-v0.2.5-aarch64-apple-darwin.tar.gz"
      sha256 "403d0b4792116cebe18451c0f53e6daa1b9ed3a9e084e287b2d1cfe6e4f1de34"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.5/vimlrs-v0.2.5-x86_64-apple-darwin.tar.gz"
      sha256 "b658946d06bdf75092dce2e086c9aae885aac088bef0e93888396aab9a91069f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.5/vimlrs-v0.2.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d04cfa6468f42defc280d9e3fbbf1af5e6df22ab62a166289893157d47a54f7c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.5/vimlrs-v0.2.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dafb094f16c4e8fec2b694ab096bad9a84d3a1b5063572c3cf5ebd22981bdca2"
    end
  end

  def install
    bin.install "viml"
  end

  test do
    assert_match "viml", shell_output("#{bin}/viml --version")
  end

  # Static musl tarballs also published at this release:
  #   vimlrs-v0.2.5-x86_64-unknown-linux-musl.tar.gz  sha256: 46c97dea35139ce797a2ed38849f4216f90558acbb1db161c7d70b375c43c07d
  #   vimlrs-v0.2.5-aarch64-unknown-linux-musl.tar.gz  sha256: c282489f5bf18f9eeeae6a690772427c58166681d9c71de452c955623893f31e
end
