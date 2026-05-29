class Nmaprs < Formula
  desc "Parallel network scanner with nmap-compatible CLI (Rust)"
  homepage "https://github.com/MenkeTechnologies/nmaprs"
  license "MIT"
  version "0.1.4"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/nmaprs/releases/download/v0.1.4/nmaprs-v0.1.4-aarch64-apple-darwin.tar.gz"
    sha256 "04770c1134d2ceca873e95286ebeb7ffa72921218e8120437825f9adb61e1dc7"
  end
  on_intel do
    url "https://github.com/MenkeTechnologies/nmaprs/releases/download/v0.1.4/nmaprs-v0.1.4-x86_64-apple-darwin.tar.gz"
    sha256 "e3ae45ec4330b31926625eea9e11ac0626eb088c5fe290af4acb70101a43b5f8"
  end
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/nmaprs/releases/download/v0.1.4/nmaprs-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "12e36555818ad20cfe29a2da7c11f3d82cc3ef2e154dab208bf0d1e1281046df"
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
