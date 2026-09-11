class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.62"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.62/zshrs-all-v0.12.62-aarch64-apple-darwin.tar.gz"
      sha256 "35891e19b28629f7b34223e6debc2f5a3fba53fe2c108198df5c0b23834a019b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.62/zshrs-all-v0.12.62-x86_64-apple-darwin.tar.gz"
      sha256 "2697de762eb8da0a52a4c93846372015cbb43588061be12ea97e65320bdeb489"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.62/zshrs-all-v0.12.62-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dd45f0561220e18edfee4b20b62e9ff65f609d1b97610dc4df95b8d8141fcedb"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.62/zshrs-all-v0.12.62-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f049118710f1edccf717447cb6e3af6d8a2e64f0cce2e7bf312003341e7b3d99"
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
