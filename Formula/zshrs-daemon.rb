class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.84"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.84/zshrs-all-v0.13.84-aarch64-apple-darwin.tar.gz"
      sha256 "70f8dfa03a4ab13aebd0f14169f18f1f42ca6fc32294ee2a0e6c41199b939442"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.84/zshrs-all-v0.13.84-x86_64-apple-darwin.tar.gz"
      sha256 "661ded8f5fb9c06bcfb14ed9deb08126e51ff05fa00f1157f2928c70299223f8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.84/zshrs-all-v0.13.84-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2c0c1c03034579b165abfadf7189d233d699aaaa3b25d5fc4c6df3959d5f5fd7"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.84/zshrs-all-v0.13.84-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e90ddd1780d4c8fe95296780dc364785742a73d7d0059576177b19d268d076ae"
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
