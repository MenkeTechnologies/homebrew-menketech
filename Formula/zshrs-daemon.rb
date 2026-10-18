class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.52"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.52/zshrs-all-v0.13.52-aarch64-apple-darwin.tar.gz"
      sha256 "680e64df20706cb49fe7be9bb6959a456d357818035d39410090815419cf173f"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.52/zshrs-all-v0.13.52-x86_64-apple-darwin.tar.gz"
      sha256 "8eebd79fe804a24dd7640aa700020ab822a08f9e0c17718008ba6f8897829bd3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.52/zshrs-all-v0.13.52-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5c481e43948983a3f9eb4b483facaab3bbc228de30d389f9d0e22b860c024b5f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.52/zshrs-all-v0.13.52-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "210ddab9ce690ee33933d4c57ccad83e5b6a96d37660a79a1e23d3eced193e5b"
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
