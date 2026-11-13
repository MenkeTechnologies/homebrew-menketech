class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.66"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.66/zshrs-all-v0.13.66-aarch64-apple-darwin.tar.gz"
      sha256 "1ffe6aa07ff4790137fc8d0305297e425c3c2d5bc7f87d1f0931aa47e86387f9"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.66/zshrs-all-v0.13.66-x86_64-apple-darwin.tar.gz"
      sha256 "32bf4c65a4ab8ac5f51e79b29d94e7bab1716bf2876dbf7d9202e6d94318d4af"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.66/zshrs-all-v0.13.66-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7068518a3fe5ecdf1d071f2c1746387312f3df7110afb1fdeb56f185b1fe7e7d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.66/zshrs-all-v0.13.66-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "91c889f77e62c6524d2594f02d0102311244070bba193aac80c2203bbff105fc"
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
