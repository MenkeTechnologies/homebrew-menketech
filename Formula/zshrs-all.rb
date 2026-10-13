class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
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
    bin.install "zshrs"
    bin.install "zd"
    bin.install "zshrs-recorder"
    bin.install "zshrs-daemon"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
    assert_predicate bin/"zshrs-recorder", :exist?
    assert_predicate bin/"zshrs-daemon", :exist?
  end

  # Static musl tarballs also published at this release:
  #   zshrs-all-v0.13.40-x86_64-unknown-linux-musl.tar.gz  sha256: 596c0e24b7afadebb564c66f5de62bd44ecbb8bde740835c60a26db4d5ffaac7
end
