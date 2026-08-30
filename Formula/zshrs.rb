class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.48"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.48/zshrs-v0.12.48-aarch64-apple-darwin.tar.gz"
      sha256 "04ca1c7f029f4d906441a416c6b8819097ec9961eb36d68196e0085c62c58200"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.48/zshrs-v0.12.48-x86_64-apple-darwin.tar.gz"
      sha256 "aebc197416c905e68c3718da58cab106002411a3240cb95ffbc05bb72185fb86"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.48/zshrs-v0.12.48-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "956864117978128121b5a233b42677df14964c2cf7b400e5569fb2d2f5f78eb4"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.48/zshrs-v0.12.48-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1752a84af1f412a3d2b75ea64e56216f1d05d1f162f812755a5cd84c080cf358"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-v0.12.48-x86_64-unknown-linux-musl.tar.gz  sha256: 532651553adaf4f101dcba60d88c4aba386cd248fd57523a8f5a6d79f676ec19
  #   zshrs-v0.12.48-aarch64-unknown-linux-musl.tar.gz  sha256: 475ef309b925212918cf070a85e99006aa24cc8749a62fcbcb7031ed821b4f36
end
