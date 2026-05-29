class Nmaprs < Formula
  desc "Parallel network scanner with nmap-compatible CLI (Rust)"
  homepage "https://github.com/MenkeTechnologies/nmaprs"
  license "MIT"
  version "0.1.5"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/nmaprs/releases/download/v0.1.5/nmaprs-v0.1.5-aarch64-apple-darwin.tar.gz"
    sha256 "1397a09b7b50adc9e98c2481b1dbd340f4138957c849619aec362dcf8ed9eade"
  end
  on_intel do
    url "https://github.com/MenkeTechnologies/nmaprs/releases/download/v0.1.5/nmaprs-v0.1.5-x86_64-apple-darwin.tar.gz"
    sha256 "9c2de04f9bc79d3c09515e8843194a5050021fde504cc799c2bbc7128fc86020"
  end
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/nmaprs/releases/download/v0.1.5/nmaprs-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ff8699547cb4879658adb6b8eb849344bb4b2b9fdcbb570ebc124a7eea566d9f"
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
