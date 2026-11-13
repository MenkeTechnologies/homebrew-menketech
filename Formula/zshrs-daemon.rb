class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.77"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.77/zshrs-all-v0.13.77-aarch64-apple-darwin.tar.gz"
      sha256 "7b14c365789f009fb9094cdc1a18c3ae0734a418d7be5ad99bca1f7a2f7d812a"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.77/zshrs-all-v0.13.77-x86_64-apple-darwin.tar.gz"
      sha256 "de413108eeb96e7be23bf39b6e598295a421e2947a8947cce6d042a1ad0c8e2a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.77/zshrs-all-v0.13.77-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e21a5011d8c97ce9e624add7c81842f321bad60d200e2335c6d50cde44c4404"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.77/zshrs-all-v0.13.77-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7ef06f499acfc4bb1177f3fa36e346f07ceacde896156f2106a989fb629bd17b"
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
