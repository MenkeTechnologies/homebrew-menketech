class Temprs < Formula
  desc "Temporary file stack manager — atomic flock-protected master record"
  homepage "https://github.com/MenkeTechnologies/temprs"
  license "MIT"
  version "2.9.5"

  on_macos do
      on_arm do
        url "https://github.com/MenkeTechnologies/temprs/releases/download/v#{version}/temprs-v#{version}-aarch64-apple-darwin.tar.gz"
        sha256 "0000000000000000000000000000000000000000000000000000000000000000"  # placeholder — auto-populated on next release tag
      end
      on_intel do
        url "https://github.com/MenkeTechnologies/temprs/releases/download/v#{version}/temprs-v#{version}-x86_64-apple-darwin.tar.gz"
        sha256 "0000000000000000000000000000000000000000000000000000000000000000"  # placeholder — auto-populated on next release tag
      end
  end

  on_linux do
      on_intel do
        url "https://github.com/MenkeTechnologies/temprs/releases/download/v#{version}/temprs-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "0000000000000000000000000000000000000000000000000000000000000000"  # placeholder — auto-populated on next release tag
      end
  end

  def install
    bin.install "temprs"
    bin.install "tp"
  end

  test do
    assert_match "temprs", shell_output("#{bin}/temprs --version")
  end
end
