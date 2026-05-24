class Temprs < Formula
  desc "Temporary file stack manager — atomic flock-protected master record"
  homepage "https://github.com/MenkeTechnologies/temprs"
  license "MIT"
  version "2.9.7"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/temprs/releases/download/v2.9.7/temprs-v2.9.7-aarch64-apple-darwin.tar.gz"
    sha256 ""
  end
  on_intel do
    url "https://github.com/MenkeTechnologies/temprs/releases/download/v2.9.7/temprs-v2.9.7-x86_64-apple-darwin.tar.gz"
    sha256 ""
  end
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/temprs/releases/download/v2.9.7/temprs-v2.9.7-x86_64-unknown-linux-gnu.tar.gz"
    sha256 ""
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
