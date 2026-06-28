class Vimlrs < Formula
  desc "Vimscript (VimL) interpreter in Rust, ported from Neovim's C eval engine"
  homepage "https://github.com/MenkeTechnologies/vimlrs"
  license "MIT"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.1.1/vimlrs-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "6033f3953b184bc1dac45809d4d70dd04be0aed50d4fcf471535b58d437d817a"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.1.1/vimlrs-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "221a5b7568f4fc93441f535126e541b7b569cb639763edd26ed13d8ee65c0415"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.1.1/vimlrs-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a47582642a88fbf301c795834b3c68910201e4c8b8635cefdcd470fe04448302"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.1.1/vimlrs-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4cd039e8d62b468d0d7733ff27a5ba12e767ec145fd0a9922223a66a80f6b9e1"
    end
  end

  def install
    bin.install "vimlrs"
  end

  test do
    assert_match "vimlrs", shell_output("#{bin}/vimlrs --version")
  end

  # Static musl tarballs also published at this release:
  #   vimlrs-v0.1.1-x86_64-unknown-linux-musl.tar.gz  sha256: b1a4e2642e1c0a4afe94188adc44a784bc0dd8799c7428c317ed5bc8607a6942
  #   vimlrs-v0.1.1-aarch64-unknown-linux-musl.tar.gz  sha256: 709501c6fdddb8d06b132140e161d38a96da1662a661c2a3943f051fe5b25561
end
