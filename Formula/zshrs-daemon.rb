class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.70"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.70/zshrs-all-v0.13.70-aarch64-apple-darwin.tar.gz"
      sha256 "8fda32d0b707af46bb714f0b24f8f01fdf93d93c0d6857d8c5935158cbc12137"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.70/zshrs-all-v0.13.70-x86_64-apple-darwin.tar.gz"
      sha256 "02d41e617f006f67eb5685f43af9186c3c78287cd7ac614bc77cd47d73cfbb50"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.70/zshrs-all-v0.13.70-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9a72a35ee479229dc8951951d01f0c234eb47295618b4d6b1ee702bc4c0fc238"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.70/zshrs-all-v0.13.70-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dd7ba9f1bc0ac41ecf56ceaca7feb84f6ce9cd1e2b66c5166afdc0421c76dbeb"
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
