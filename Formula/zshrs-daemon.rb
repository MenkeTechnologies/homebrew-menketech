class ZshrsDaemon < Formula
  desc "zshrs daemon + zd client only — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.28"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.28/zshrs-all-v0.12.28-aarch64-apple-darwin.tar.gz"
      sha256 "d3b8d0f902972993ec9d3c06f66dff8d7cea44a2519469caf9216c5c75d1f517"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.28/zshrs-all-v0.12.28-x86_64-apple-darwin.tar.gz"
      sha256 "3d14b81ad33843fc81fce692343b379f1bc5f52c4adaa6ab75d4cb89fe4395a9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.28/zshrs-all-v0.12.28-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "762e59d426ca91b21c328d88a5a52e1b5ecfb3350674c08e793f443c8b451317"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.28/zshrs-all-v0.12.28-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "25d8b6619f8b821efd9dc5c44120caaeb0cda8647ec60ad03015ca4bca555bc3"
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
