class Vimlrs < Formula
  desc "Vimscript (VimL) interpreter in Rust, ported from Neovim's C eval engine"
  homepage "https://github.com/MenkeTechnologies/vimlrs"
  license "MIT"
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.1/vimlrs-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "5ad1c193dcc52af0b33915454e6afe193c19469b3f438a1420a503377a1cc7bc"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.1/vimlrs-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "74b09ef05925dda24463e7e7de0c184278e9df79ed036ec6d1375610bc43d0b6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.1/vimlrs-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6ae692298336ab50dd6211e5029053532bb9e73ac361432f249225110e2e320d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.1/vimlrs-v0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "825a72966222cb9a9edc81b091b6c3ab881d774d059cec6b8589627e5276d112"
    end
  end

  def install
    bin.install "viml"
  end

  test do
    assert_match "viml", shell_output("#{bin}/viml --version")
  end

  # Static musl tarballs also published at this release:
  #   vimlrs-v0.2.1-x86_64-unknown-linux-musl.tar.gz  sha256: abf79a5a880fd69b384acf884c30e3201536c367867d2d21dab476124e3d5ba6
  #   vimlrs-v0.2.1-aarch64-unknown-linux-musl.tar.gz  sha256: 50ef4fe833ecaa2b1da35220a61b6e0a53f13a5ed49fe8a3203e9b65aa45d8ec
end
