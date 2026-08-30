class Lsofrs < Formula
  desc "Rust rewrite of lsof — 5–21× faster, 7-tab TUI, 31 cyberpunk themes"
  homepage "https://github.com/MenkeTechnologies/lsofrs"
  license "MIT"
  version "4.10.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.10.0/lsofrs-v4.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "b1f4e0892b21d3514e415f6f0736212a990468ceba995a03a4ce797991a38247"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.10.0/lsofrs-v4.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "beb0b9df597ebf1689f1fa6035b7da89906bee8c9b054847c9a8453ed6d67766"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.10.0/lsofrs-v4.10.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6f34c3f543153c2ce040849452fc12884c9b96a64e64b9a16ce4068e23ab93e0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.10.0/lsofrs-v4.10.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "160446abacefa8772776df5d47e9cef54a40338c9463031604f4ea6fa02b4d1a"
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
  #   lsofrs-v4.10.0-x86_64-unknown-linux-musl.tar.gz  sha256: 54ab795f34a571f1cfd1c8f79dc5a50412285aebe3f7159ffacfde98b0e3ffb6
  #   lsofrs-v4.10.0-aarch64-unknown-linux-musl.tar.gz  sha256: f1be6d0ffce68c6b8050fa5ca87c52adcd1a163ac519aa801e53093a3e5e3d67
end
