class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.56"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.56/zshrs-all-v0.12.56-aarch64-apple-darwin.tar.gz"
      sha256 "9b4431da5fcbfac16300fa58e5b87eb4c73160f74f3fbe361e9a2a0ff3463860"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.56/zshrs-all-v0.12.56-x86_64-apple-darwin.tar.gz"
      sha256 "6945dd8be56da9fc2f00d9aa229e0a2f238dd02929c0355b49f3fd764654bfc7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.56/zshrs-all-v0.12.56-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f512d78b38ddc239d94ace1eadbd65e03d8029dfed335104dcef520db49f78fc"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.56/zshrs-all-v0.12.56-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6dd8190cdd1dfbdde2607d98431baff264cd1e9a3c151acf4ea7d2f52c45d8bc"
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
