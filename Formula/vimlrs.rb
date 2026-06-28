class Vimlrs < Formula
  desc "Faithful Rust port of the Vimscript (VimL) interpreter, from the Neovim C eval engine"
  homepage "https://github.com/MenkeTechnologies/vimlrs"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.1.0/vimlrs-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "3230d4582ba8726cf8cf589fbc2d7ed635b33c724760cf85447c4aab69e270e6"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.1.0/vimlrs-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "566675927afa3d7614be4d5952fac312b9fd858159995822577df22d50f6bfd5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.1.0/vimlrs-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b574a4f7b0c9b05fc98f088421375a2622f511577bde1ff72e95df92c6eeba7c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.1.0/vimlrs-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "221b99f6584a08b37f30ea777c3aa8d8bc767940050514f5d3609a8962c19b00"
    end
  end

  def install
    bin.install "vimlrs"
  end

  test do
    assert_match "vimlrs", shell_output("#{bin}/vimlrs --version")
  end

  # Static musl tarballs also published at this release:
  #   vimlrs-v0.1.0-x86_64-unknown-linux-musl.tar.gz  sha256: 3a84558b5cd37c7f872edfc97fe9c4c1a7f955d4105ce09ba2f96a442f007aa0
  #   vimlrs-v0.1.0-aarch64-unknown-linux-musl.tar.gz  sha256: bd434cabd30f50809a2ae5f047b2a2ff7256f5cc8e898c149ce2884cd328dbbc
end
