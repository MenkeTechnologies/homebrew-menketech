class ZshrsDaemon < Formula
  desc "Daemon + zd client only — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.6"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.6/zshrs-all-v0.12.6-aarch64-apple-darwin.tar.gz"
      sha256 "e7734929d29605e05961e41af9359ffec5d71a0d7b4c3c96e0250230d1e0c02c"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.6/zshrs-all-v0.12.6-x86_64-apple-darwin.tar.gz"
      sha256 "6515f3145305065b78842e142c255038f19ceb4ee518a963f4c8ef77b4ae8c33"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.6/zshrs-all-v0.12.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "709e3f8c445657393f5e012ca4593ee1e758be2e51637a11a404f616e304c86d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.6/zshrs-all-v0.12.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7fb0b6e4c0a8847d832158b3f5bb6a20dc0242af9796df76fc7a8d08f6161a3d"
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
