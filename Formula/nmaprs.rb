class Nmaprs < Formula
  desc "Parallel network scanner with nmap-compatible CLI (Rust)"
  homepage "https://github.com/MenkeTechnologies/nmaprs"
  license "MIT"
  version "0.1.2"

  on_macos do
      on_arm do
        url "https://github.com/MenkeTechnologies/nmaprs/releases/download/v#{version}/nmaprs-v#{version}-aarch64-apple-darwin.tar.gz"
        sha256 "0000000000000000000000000000000000000000000000000000000000000000"  # placeholder — auto-populated on next release tag
      end
      on_intel do
        url "https://github.com/MenkeTechnologies/nmaprs/releases/download/v#{version}/nmaprs-v#{version}-x86_64-apple-darwin.tar.gz"
        sha256 "0000000000000000000000000000000000000000000000000000000000000000"  # placeholder — auto-populated on next release tag
      end
  end

  on_linux do
      on_intel do
        url "https://github.com/MenkeTechnologies/nmaprs/releases/download/v#{version}/nmaprs-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "0000000000000000000000000000000000000000000000000000000000000000"  # placeholder — auto-populated on next release tag
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
