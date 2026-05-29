class Iftoprs < Formula
  desc "Real-time bandwidth monitor — Rust iftop clone with ratatui TUI, 31 themes"
  homepage "https://github.com/MenkeTechnologies/iftoprs"
  license "MIT"
  version "2.22.5"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v2.22.5/iftoprs-v2.22.5-aarch64-apple-darwin.tar.gz"
    sha256 "d533bd910e3610daab1c5cde0decf69b819c8d69d3b752f85d051b6c7d33a938"
  end
  on_intel do
    url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v2.22.5/iftoprs-v2.22.5-x86_64-apple-darwin.tar.gz"
    sha256 "c61d06ebadd8d1ca8c7cbe8cd7ead3745f516f5e2e70acc502cb203dbae4e877"
  end
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v2.22.5/iftoprs-v2.22.5-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "31a240884f67e5b50ff9e9ebb560c04b1d336ebb9585de0be00c3c670ce88a59"
  end
  end

  def install
  bin.install "iftoprs"
  end

  test do
    assert_match "iftoprs", shell_output("#{bin}/iftoprs --version")
  end
end
