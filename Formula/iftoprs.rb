class Iftoprs < Formula
  desc "Real-time bandwidth monitor — Rust iftop clone with ratatui TUI, 31 themes"
  homepage "https://github.com/MenkeTechnologies/iftoprs"
  license "MIT"
  version "2.22.4"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v2.22.4/iftoprs-v2.22.4-aarch64-apple-darwin.tar.gz"
    sha256 "7c3eaa590df47081ef545efd0a09b8c4edb39d9ecdcffd8174a7f0e866837bae"
  end
  on_intel do
    url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v2.22.4/iftoprs-v2.22.4-x86_64-apple-darwin.tar.gz"
    sha256 "68a041f780fd840803230aa0e74eaf7d0c41cc8d28802ac38104fe8e4c490dcd"
  end
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v2.22.4/iftoprs-v2.22.4-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3891263b833970cab2a9b5b70fb006bacea4cada528270a1ffdf9e8dbac38512"
  end
  end

  def install
  bin.install "iftoprs"
  end

  test do
    assert_match "iftoprs", shell_output("#{bin}/iftoprs --version")
  end
end
