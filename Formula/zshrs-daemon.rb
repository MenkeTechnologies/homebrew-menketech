class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.83"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.83/zshrs-all-v0.13.83-aarch64-apple-darwin.tar.gz"
      sha256 "b6fb879fe6bf00ca2855bcd053eb46b768a564bd09c6f0902f084b73f0cbd7bd"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.83/zshrs-all-v0.13.83-x86_64-apple-darwin.tar.gz"
      sha256 "4688f8b0e7e9944ddb5108a01dacc9c9058f14c646c93821c6af33174e926abb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.83/zshrs-all-v0.13.83-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e348700558a0cc9ca15edeb268ce46745a481996a7e6634cdadeb88112debc23"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.83/zshrs-all-v0.13.83-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "75550b2dd6e9730b1c115c97bb3259b5126255753b84f6ff46063ab7ca3ece8c"
    end
  end

  def install
    bin.install "zshrs-daemon"
    bin.install "zd"
  end

  test do
    assert_match "zshrs-daemon #{version}", shell_output("#{bin}/zshrs-daemon --version")
    assert_match "zd #{version}", shell_output("#{bin}/zd --version")
  end
end
