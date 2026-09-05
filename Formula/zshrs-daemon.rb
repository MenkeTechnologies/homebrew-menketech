class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.59"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.59/zshrs-all-v0.12.59-aarch64-apple-darwin.tar.gz"
      sha256 "65aa9caf4391e6b8f6e45f57efa82cfb34ce6adb6799550e04af1b6f0c7e13a2"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.59/zshrs-all-v0.12.59-x86_64-apple-darwin.tar.gz"
      sha256 "093cbef6557fd688e95ee6522b5c7bbfef3ce4204963f17eb88f82033cb55317"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.59/zshrs-all-v0.12.59-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1b542430ada48d497d328965937c8bf9d0973cef8e52d3be8b79e1996dfa9e52"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.59/zshrs-all-v0.12.59-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dc707e69b9a90f7bf022f2455d80b847f1cf6df39e5f7bc84b39f22546d198af"
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
