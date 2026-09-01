class Lsofrs < Formula
  desc "Rust rewrite of lsof — 5–21× faster, 7-tab TUI, 31 cyberpunk themes"
  homepage "https://github.com/MenkeTechnologies/lsofrs"
  license "MIT"
  version "4.10.6"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.10.6/lsofrs-v4.10.6-aarch64-apple-darwin.tar.gz"
      sha256 "22350bfd7223800caf7d0304f083bd8c797b36b0d11a88a719ae09323c46f0b6"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.10.6/lsofrs-v4.10.6-x86_64-apple-darwin.tar.gz"
      sha256 "bd5a20bd7c336963566253e2c5adc894934df9a2a741bee947eb5b6297ca1e01"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.10.6/lsofrs-v4.10.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f3c8fb8d74040950d09fe1c34151bacffc935697e2eb38365153e28a2e472b08"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.10.6/lsofrs-v4.10.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "61b2b859129d59d5657ad407f899f8b2f3243d55abb2100397b9543cc4d29c41"
    end
  end

  def install
    bin.install "lsofrs"
    bin.install "lsf"
  end

  test do
    assert_match "lsofrs", shell_output("#{bin}/lsf --version")
  end

  # Static musl tarballs also published at this release:
  #   lsofrs-v4.10.6-x86_64-unknown-linux-musl.tar.gz  sha256: 24097afe337fdc01d8c7490530bc5d8d47010abea63bf02335f7b1bd3729e77d
  #   lsofrs-v4.10.6-aarch64-unknown-linux-musl.tar.gz  sha256: 8fab4efd47f373d799b6fa8c2b70b046492758f9cb5b5416a4e602f8909da525
end
