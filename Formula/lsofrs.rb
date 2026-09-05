class Lsofrs < Formula
  desc "Rust rewrite of lsof — 5–21× faster, 7-tab TUI, 31 cyberpunk themes"
  homepage "https://github.com/MenkeTechnologies/lsofrs"
  license "MIT"
  version "4.11.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.11.1/lsofrs-v4.11.1-aarch64-apple-darwin.tar.gz"
      sha256 "f0d45873198cadb8aaeaf85198a64f75082bb14bf4d144fbad0ab45b33ed98e2"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.11.1/lsofrs-v4.11.1-x86_64-apple-darwin.tar.gz"
      sha256 "0f1b0e94ed82aefeb57e50d2419163d5a5810765380f1240ac37e4907bc99521"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.11.1/lsofrs-v4.11.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "69017a15702a603e5e54cda11d1a3664e774d96e6df81d896750f2e77eeed583"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.11.1/lsofrs-v4.11.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "53659210823752827c55c8fe95b78455333af8c6fe75e3d1bf904e4cb50dda74"
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
  #   lsofrs-v4.11.1-x86_64-unknown-linux-musl.tar.gz  sha256: f1154559ecb1204dcbeba7b6f8c1119469039aefc90e0e4ad9806c86ec024fee
  #   lsofrs-v4.11.1-aarch64-unknown-linux-musl.tar.gz  sha256: 8f554815d6d37cc54f695ab7561e66b7cd8d094cf08e8c4398cb3c6c8041e6cc
end
