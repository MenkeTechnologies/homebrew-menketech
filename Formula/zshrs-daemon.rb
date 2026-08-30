class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.44"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.44/zshrs-all-v0.12.44-aarch64-apple-darwin.tar.gz"
      sha256 "4fc483948cabf34c9c2d484690034ce92c51945cecb50b1537c157e31365b25a"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.44/zshrs-all-v0.12.44-x86_64-apple-darwin.tar.gz"
      sha256 "6637f763d124e12440633fb4c9bd3c853eab3ba349364540140bb2d174243116"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.44/zshrs-all-v0.12.44-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cb2edf8f5386e73859a509c8df223e595071dc28975ebd66adfed1cf0538f7a7"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.44/zshrs-all-v0.12.44-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ea6c63bbf2659860b1b5a7fa6321463e8cb0f36ac838cd14eef2199715d6fe6d"
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
