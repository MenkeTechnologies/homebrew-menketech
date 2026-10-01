class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.68"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.68/zshrs-all-v0.12.68-aarch64-apple-darwin.tar.gz"
      sha256 "200cab4dd146ce4f879b1dff38321820a8d12ff974bc255a85c0f199170b0747"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.68/zshrs-all-v0.12.68-x86_64-apple-darwin.tar.gz"
      sha256 "63fa0253112f100cb84ec548bf18944491c64d492decc0100da1f078fb25debe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.68/zshrs-all-v0.12.68-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bcf248678aa18255baf33b6d828c51a99530475b310acce2d66f9282df2ccd96"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.68/zshrs-all-v0.12.68-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "520b9cfbb82dc107d1686379dfb92e6d047e3a4867f92a468d52b75f8dff1dec"
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
