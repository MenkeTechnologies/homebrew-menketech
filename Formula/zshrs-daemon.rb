class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.12"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.12/zshrs-all-v0.13.12-aarch64-apple-darwin.tar.gz"
      sha256 "53e96d846ad2babde80b6de78c56390dd2e418a83fc8117bbb7a0c8e6d7655e6"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.12/zshrs-all-v0.13.12-x86_64-apple-darwin.tar.gz"
      sha256 "7214e5fe5fdb0c3a2a46d97f8d28c8e5ace788bf181709dd6a9d24f3e76cccd7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.12/zshrs-all-v0.13.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5b21a175b260e43fb26024b97a83057df6637acfacb2d20fe14bff5ca4aebd07"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.12/zshrs-all-v0.13.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "331ab2f6c9e43421907d481d2716058686601d0275ea8f074980bb5e318b7904"
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
