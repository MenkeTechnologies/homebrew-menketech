class Vimlrs < Formula
  desc "Vimscript (VimL) interpreter in Rust, ported from Neovim's C eval engine"
  homepage "https://github.com/MenkeTechnologies/vimlrs"
  license "MIT"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.0/vimlrs-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "d8ddf3daa38c63df0645a0d1fe36c166cc3a7d676bcc07781838f325525184dd"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.0/vimlrs-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "f37be40219a1724f5affbf2b7b0603b047b7130688b07c500cb92b01d323d83a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.0/vimlrs-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f9e01fbe8e46a0756e2dc618ca0904790cdd95e617878329aa473a4fbb05d157"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.0/vimlrs-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "733d48e8f0bcc70cb1c0c8ad102c94dfae734914125bda9e6a7d5383c026dfa3"
    end
  end

  def install
    bin.install "viml"
  end

  test do
    assert_match "viml", shell_output("#{bin}/viml --version")
  end

  # Static musl tarballs also published at this release:
  #   vimlrs-v0.2.0-x86_64-unknown-linux-musl.tar.gz  sha256: dc0e464afd0fb27a349118547f9d6313ab61dcd5ac90d8a0bab5331d8de1f748
  #   vimlrs-v0.2.0-aarch64-unknown-linux-musl.tar.gz  sha256: 46f7697851985f674848405ed09690d3938421a8fa6bd1f305c12e902756a385
end
