class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.42"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.42/zshrs-all-v0.13.42-aarch64-apple-darwin.tar.gz"
      sha256 "ef60e453bc4f7f8d64c4cee8eb1d6a613b15b2f6938e77b9eb4ea62a09633bf9"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.42/zshrs-all-v0.13.42-x86_64-apple-darwin.tar.gz"
      sha256 "1a2945bbb03b7b11e5172654f1206c0ce250a58019c7e2b318dff97305fd8002"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.42/zshrs-all-v0.13.42-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "015f0fd71f5005cc1e39eb16bf0b58516d138064ca675b0da4b2cf95711a3f39"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.42/zshrs-all-v0.13.42-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cd6c892ac6544f9938abf2c66086c0221f73d896bea0ec722c0fbf3681697803"
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
