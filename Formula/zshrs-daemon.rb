class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.19"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.19/zshrs-all-v0.13.19-aarch64-apple-darwin.tar.gz"
      sha256 "66035da0efaba4c8b0bd3ac0a8c67599e14c404cc2b752ef45e3bfb39e81cbec"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.19/zshrs-all-v0.13.19-x86_64-apple-darwin.tar.gz"
      sha256 "3e34718a01c18234c0163edf9dcc1f043929862458f06b75f63be83cde6b96bf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.19/zshrs-all-v0.13.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4550f7d13799ec28d616c6526a16bc5edca13a8a14489fe94fee3598d3357710"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.19/zshrs-all-v0.13.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "16fa2239ef311879b0c7769711cb688c098ad35dc6b698e62654e2ff71956426"
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
