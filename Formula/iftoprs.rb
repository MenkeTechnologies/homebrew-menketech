class Iftoprs < Formula
  desc "Real-time bandwidth monitor — Rust iftop clone with ratatui TUI, 31 themes"
  homepage "https://github.com/MenkeTechnologies/iftoprs"
  license "MIT"
  version "2.22.8"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v2.22.8/iftoprs-v2.22.8-aarch64-apple-darwin.tar.gz"
      sha256 "bab6e14752cec721994ba8a034c9e1023a3aea3c141647dcd2c1fa62bf851f59"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v2.22.8/iftoprs-v2.22.8-x86_64-apple-darwin.tar.gz"
      sha256 "cbecb8cee4c25cc29363da0b5607f157ede21de128024fed32f9514add89f834"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v2.22.8/iftoprs-v2.22.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eeb0d79afe5016a5d4c574b40c0907bd4a8f99ff008542043ec3a152de1cf586"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v2.22.8/iftoprs-v2.22.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2349c59f453c9ce3328f488e3de690c8aaf43c4583d83fbeae8d530d75f9e808"
    end
  end

  def install
    bin.install "iftoprs"
  end

  test do
    assert_match "iftoprs", shell_output("#{bin}/iftoprs --version")
  end
end
