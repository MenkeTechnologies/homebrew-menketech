class Nmaprs < Formula
  desc "Parallel network scanner with nmap-compatible CLI (Rust)"
  homepage "https://github.com/MenkeTechnologies/nmaprs"
  license "MIT"
  version "0.1.8"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/nmaprs/releases/download/v0.1.8/nmaprs-v0.1.8-aarch64-apple-darwin.tar.gz"
      sha256 "c8cd78c40919906f2988aa049f2f820af4f8587c8414a6ed144f14b0cb5dafc4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/nmaprs/releases/download/v0.1.8/nmaprs-v0.1.8-x86_64-apple-darwin.tar.gz"
      sha256 "daad4a235cdf27b7a869b5bf0a3d1657a11f40a5adedf27eb2c61e413ecb491d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/nmaprs/releases/download/v0.1.8/nmaprs-v0.1.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "14de1cac745c64b6c84e30f287fe0db199d618694386246bdfe23ca4ece8bc90"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/nmaprs/releases/download/v0.1.8/nmaprs-v0.1.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8273bee0056947cc3bcc7bc7c83a275b38e17a0622ddc7fefe0fa8a51cfcf92c"
    end
  end

  def install
    bin.install "nmaprs"
    bin.install "nms"
  end

  test do
    assert_match "nmaprs", shell_output("#{bin}/nmaprs --version")
  end
end
