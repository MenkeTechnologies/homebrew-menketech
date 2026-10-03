class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.70"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.70/zshrs-all-v0.12.70-aarch64-apple-darwin.tar.gz"
      sha256 "21e0aea109f69eaa283c30b1e715b368308f26f7dd5c6067df9e2e4cc8aa28fa"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.70/zshrs-all-v0.12.70-x86_64-apple-darwin.tar.gz"
      sha256 "c6db69d893cea5af1538714f3cb7f7710e5ca1e5de30590335c073efa2935964"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.70/zshrs-all-v0.12.70-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "84fc9ed9fdd759f3960e7038a8d2c3fd08e1648308324a14e53d72146ffd5a65"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.70/zshrs-all-v0.12.70-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aad700110a88dff29cc5f492f27a614cfa5fd2410a262294e295cb25a01b52a8"
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
