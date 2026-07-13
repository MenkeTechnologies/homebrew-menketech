class Vimlrs < Formula
  desc "Vimscript (VimL) interpreter in Rust, ported from Neovim's C eval engine"
  homepage "https://github.com/MenkeTechnologies/vimlrs"
  license "MIT"
  version "0.2.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.2/vimlrs-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "9b1e4ac62b34ea1eb443ab9ab1d34fecc64a40218427f25dfbdf941f7ac58a10"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.2/vimlrs-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "d9281334326a609b4398bd6ba5b7eed5cd750e54a33b25a8935bec5ac7c715a1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.2/vimlrs-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aa924c522f50fb8692ff0a4780c7f13c0cfa5b5a275f04ecfae054bb1d85c8eb"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.2/vimlrs-v0.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "921ec97a0794095d5713f84bbaebf378ddd8a47c635116597e148a9c7e79e79d"
    end
  end

  def install
    bin.install "viml"
  end

  test do
    assert_match "viml", shell_output("#{bin}/viml --version")
  end

  # Static musl tarballs also published at this release:
  #   vimlrs-v0.2.2-x86_64-unknown-linux-musl.tar.gz  sha256: 9976ebef62a01b5f01987b5155d411b767a7bda9ce24b3ef00003d4a4149ce26
  #   vimlrs-v0.2.2-aarch64-unknown-linux-musl.tar.gz  sha256: f3b05cc0f45e1e1170d852b912e5961e007bae242b980407570764e2599ccc1c
end
