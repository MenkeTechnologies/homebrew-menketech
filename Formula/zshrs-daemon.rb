class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.25"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.25/zshrs-all-v0.13.25-aarch64-apple-darwin.tar.gz"
      sha256 "d0b7f97035de51c81f5ca4999e882e7ed8b120aa5290eda22325b7dd9f13382f"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.25/zshrs-all-v0.13.25-x86_64-apple-darwin.tar.gz"
      sha256 "31009b344927bb8b6437151c88a320a770a16c4dabd9c00ac727d3923f749f35"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.25/zshrs-all-v0.13.25-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "734040ad5021877bd94a1f013314029eca85fbb08213c2d08032f6386ce1568a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.25/zshrs-all-v0.13.25-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "54bc122abfa66727c1dc40b1418224f9226dc0ccf03196ee4b8abc81391be830"
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
