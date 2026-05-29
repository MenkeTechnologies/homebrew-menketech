class Temprs < Formula
  desc "Temporary file stack manager — atomic flock-protected master record"
  homepage "https://github.com/MenkeTechnologies/temprs"
  license "MIT"
  version "2.9.9"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/temprs/releases/download/v2.9.9/temprs-v2.9.9-aarch64-apple-darwin.tar.gz"
    sha256 "b98b008a41ea3e3d9fd7b1b6f6ea0fb1b2292c0849b2bbde0a75e213a410e44a"
  end
  on_intel do
    url "https://github.com/MenkeTechnologies/temprs/releases/download/v2.9.9/temprs-v2.9.9-x86_64-apple-darwin.tar.gz"
    sha256 "f3566fd8d3f6623cee01debeaba0a3d3229978cf6d3a542ee2b3181aac9b1146"
  end
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/temprs/releases/download/v2.9.9/temprs-v2.9.9-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "55df313fec56bb7eec85d3b951f6260fb321b1c9dd13834b77e7d1e87235012b"
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
