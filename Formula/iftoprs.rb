class Iftoprs < Formula
  desc "Real-time bandwidth monitor — Rust iftop clone with ratatui TUI, 31 themes"
  homepage "https://github.com/MenkeTechnologies/iftoprs"
  license "MIT"
  version "2.22.3"

  on_macos do
      on_arm do
        url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v#{version}/iftoprs-v#{version}-aarch64-apple-darwin.tar.gz"
        sha256 "0000000000000000000000000000000000000000000000000000000000000000"  # placeholder — auto-populated on next release tag
      end
      on_intel do
        url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v#{version}/iftoprs-v#{version}-x86_64-apple-darwin.tar.gz"
        sha256 "0000000000000000000000000000000000000000000000000000000000000000"  # placeholder — auto-populated on next release tag
      end
  end

  on_linux do
      on_intel do
        url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v#{version}/iftoprs-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "0000000000000000000000000000000000000000000000000000000000000000"  # placeholder — auto-populated on next release tag
      end
  end

  def install
    bin.install "iftoprs"
  end

  test do
    assert_match "iftoprs", shell_output("#{bin}/iftoprs --version")
  end
end
