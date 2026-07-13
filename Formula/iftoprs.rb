class Iftoprs < Formula
  desc "Real-time bandwidth monitor — Rust iftop clone with ratatui TUI, 31 themes"
  homepage "https://github.com/MenkeTechnologies/iftoprs"
  license "MIT"
  version "2.22.10"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v2.22.10/iftoprs-v2.22.10-aarch64-apple-darwin.tar.gz"
      sha256 "fd37cb89269e85b275c2cd8edea7f149551d43d38d3493e4b8b1e99899d61b72"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v2.22.10/iftoprs-v2.22.10-x86_64-apple-darwin.tar.gz"
      sha256 "5cfe3e4b1c53f45884ca07d858dec57ef865458102af2b0fa07fa67da9f25220"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v2.22.10/iftoprs-v2.22.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "508677ae11b3ec876c0c101e2303462170af699e8f996155c7fe66fc8e1f1b14"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v2.22.10/iftoprs-v2.22.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3ec5cb7d0f8bb076d522b334b8a70391159dd5000ba45fc63ac2aded54bc1312"
    end
  end

  def install
    bin.install "iftoprs"
  end

  test do
    assert_match "iftoprs", shell_output("#{bin}/iftoprs --version")
  end
end
