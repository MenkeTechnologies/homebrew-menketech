class Vimlrs < Formula
  desc "Vimscript (VimL) interpreter in Rust, ported from Neovim's C eval engine"
  homepage "https://github.com/MenkeTechnologies/vimlrs"
  license "MIT"
  version "0.2.7"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.7/vimlrs-v0.2.7-aarch64-apple-darwin.tar.gz"
      sha256 "9bae8b47026963d113c2d13857533c79c781f0c2ecd018275d035d8d29187ff7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.7/vimlrs-v0.2.7-x86_64-apple-darwin.tar.gz"
      sha256 "62ba27e4852eab84c67650e618a09703f97d4b717c4af84429d0925a984d1b81"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.7/vimlrs-v0.2.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e5af97837f41dfc9d5a82fab2fe98e160127130013bed33fb5db97fe5ac46a13"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.7/vimlrs-v0.2.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a320992dc47e0ebcd86c88adeed46428bf4e08b51ba170e1c5457b1e57e82e16"
    end
  end

  def install
    bin.install "viml"
  end

  test do
    assert_match "viml", shell_output("#{bin}/viml --version")
  end

  # Static musl tarballs also published at this release:
  #   vimlrs-v0.2.7-x86_64-unknown-linux-musl.tar.gz  sha256: 0581bc7b21f03aa2a32336a127946740775a4c484a854a080939a28410e7237c
  #   vimlrs-v0.2.7-aarch64-unknown-linux-musl.tar.gz  sha256: 9833272eb958bd3a25b90ab42ddeb20282fa3b2d4c02e8246d614a7e29ac9779
end
