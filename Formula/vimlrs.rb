class Vimlrs < Formula
  desc "Vimscript (VimL) interpreter in Rust, ported from Neovim's C eval engine"
  homepage "https://github.com/MenkeTechnologies/vimlrs"
  license "MIT"
  version "0.2.6"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.6/vimlrs-v0.2.6-aarch64-apple-darwin.tar.gz"
      sha256 "31dcb3799b45d54256d1d632864b89c7c183e53a26021e971d1d5d4c51ab3cb5"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.6/vimlrs-v0.2.6-x86_64-apple-darwin.tar.gz"
      sha256 "9462a8cfc6c62479840fa9406102d558ced93112d867bbd01d16449c86c9541b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.6/vimlrs-v0.2.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4211bd89e5edea292f48cc9bf8c92f10353700d0c94f20afea5f6ca9272b85d6"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.6/vimlrs-v0.2.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9d16990fdd499300c20b4950fd8b4dbe3a67bdd72428abddd976c1662b64ea5e"
    end
  end

  def install
    bin.install "viml"
  end

  test do
    assert_match "viml", shell_output("#{bin}/viml --version")
  end

  # Static musl tarballs also published at this release:
  #   vimlrs-v0.2.6-x86_64-unknown-linux-musl.tar.gz  sha256: 1034db724c04a04101e5217653d47dc5154c27b33ad714ca805f66588c715b5a
  #   vimlrs-v0.2.6-aarch64-unknown-linux-musl.tar.gz  sha256: 824b48e20b643d396fe3dc283fe44dfdeffe9c5fb2c7999f974098269df043b8
end
