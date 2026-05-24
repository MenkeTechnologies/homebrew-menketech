class Temprs < Formula
  desc "Temporary file stack manager — atomic flock-protected master record"
  homepage "https://github.com/MenkeTechnologies/temprs"
  license "MIT"
  version "2.9.8"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/temprs/releases/download/v2.9.8/temprs-v2.9.8-aarch64-apple-darwin.tar.gz"
    sha256 "4e2620635b7499b36ae808661b3e10fba2babecf7420c351adc056743e962c1a"
  end
  on_intel do
    url "https://github.com/MenkeTechnologies/temprs/releases/download/v2.9.8/temprs-v2.9.8-x86_64-apple-darwin.tar.gz"
    sha256 "fa14619536d8b3694b5807d95bf75fbd00dd61d972f89a6f0ffb8ffd8d93bf33"
  end
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/temprs/releases/download/v2.9.8/temprs-v2.9.8-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1ab93679f60c89f0c7c51a2997f1372f55d414bd43d4f3a8b24d4f047e2a318a"
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
