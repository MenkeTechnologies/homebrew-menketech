class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.40"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.40/zshrs-all-v0.13.40-aarch64-apple-darwin.tar.gz"
      sha256 "c5951e87b390b67248df5044215dc7fe40d646c3f5cca1e95fbaa31895a2f9ed"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.40/zshrs-all-v0.13.40-x86_64-apple-darwin.tar.gz"
      sha256 "811c9ff5f136608c4d4d4231de5071c904c9274e0a2922f5c416625f6c628f08"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.40/zshrs-all-v0.13.40-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "826a2ddd3ad51d5d1cc351c1c54841fca8791d9c2b428c850888ddf2b85bdaa0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.40/zshrs-all-v0.13.40-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "930af995a265b2471e8f000d5cf02dee8d2433d72c646517d3a82cae7150462e"
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
