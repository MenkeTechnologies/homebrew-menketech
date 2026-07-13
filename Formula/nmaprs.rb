class Nmaprs < Formula
  desc "Parallel network scanner with nmap-compatible CLI (Rust)"
  homepage "https://github.com/MenkeTechnologies/nmaprs"
  license "MIT"
  version "0.1.10"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/nmaprs/releases/download/v0.1.10/nmaprs-v0.1.10-aarch64-apple-darwin.tar.gz"
      sha256 "18baed8f6845ed98903ba8810780614460f48a04f35eda8771fd522d1c2263e7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/nmaprs/releases/download/v0.1.10/nmaprs-v0.1.10-x86_64-apple-darwin.tar.gz"
      sha256 "1cb267345dab22c1602030a270eef7d7cf59e228453bbee71001016dc8325359"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/nmaprs/releases/download/v0.1.10/nmaprs-v0.1.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "92c8ebea4f99eb831e33a11eff4afb4f9b147c0076248bd358911c55ef8edea3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/nmaprs/releases/download/v0.1.10/nmaprs-v0.1.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b4b46eb7fe3ad0da3bc01c5cdfc8d5996fd23c4325b71c730377661132a39b39"
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
