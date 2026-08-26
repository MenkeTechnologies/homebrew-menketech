class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.40"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.40/zshrs-all-v0.12.40-aarch64-apple-darwin.tar.gz"
      sha256 "cbe77ca3b563db87101a7bb3da41c94f8a1456b867870392729da669fe23d506"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.40/zshrs-all-v0.12.40-x86_64-apple-darwin.tar.gz"
      sha256 "e5fbd43d347af3b6b1d2055e4205b87c576c078c8d8388709d08d5d8d384de76"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.40/zshrs-all-v0.12.40-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6093523e8886e3969b76c8f1c52cb85e77dab2f39d16f045797d7a24d91b7905"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.40/zshrs-all-v0.12.40-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ba768f295632cd920761df10a6a6a1c0a971ba366dbeca3d18d8f7771605d63a"
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
