class Iftoprs < Formula
  desc "Real-time bandwidth monitor — Rust iftop clone with ratatui TUI, 31 themes"
  homepage "https://github.com/MenkeTechnologies/iftoprs"
  license "MIT"
  version "2.22.15"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v2.22.15/iftoprs-v2.22.15-aarch64-apple-darwin.tar.gz"
      sha256 "73bc198f78acfef073311edd5eaac3c68b6835e81ace4962789515384d23bcb8"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v2.22.15/iftoprs-v2.22.15-x86_64-apple-darwin.tar.gz"
      sha256 "8ec015d4f569e313daf0346e46446f108c807d70ff2d9bffe93d654c751d440d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v2.22.15/iftoprs-v2.22.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "921d2be54ac5b1fcdb5c76d07cdca8df2a9b499deebb3e0c715a3fd7969528cf"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/iftoprs/releases/download/v2.22.15/iftoprs-v2.22.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "86ba9fbcb8651ca68238e1e6e37adb7591cd8ebcefb888b3740ca8e9f17f8c54"
    end
  end

  def install
    bin.install "iftoprs"
  end

  test do
    assert_match "iftoprs", shell_output("#{bin}/iftoprs --version")
  end
end
