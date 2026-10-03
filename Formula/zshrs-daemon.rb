class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.1/zshrs-all-v0.13.1-aarch64-apple-darwin.tar.gz"
      sha256 "ec2145c87a58f9514f9c06bf40067b619f1d7ccb0f8aaa034e7cc15bbd7d36a6"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.1/zshrs-all-v0.13.1-x86_64-apple-darwin.tar.gz"
      sha256 "94668c4c2d332f8e48818861ff090c5b44d32b42096216ff15837932c7462e17"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.1/zshrs-all-v0.13.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e06fba26c4de578116aeaaddd134205a29662b170a89a2bbf3f7c7f0b740b38"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.1/zshrs-all-v0.13.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c967fd4c16b77c93b155d667d78d8eb2df9f070fc1c7d38eadc37548b6b4ab75"
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
