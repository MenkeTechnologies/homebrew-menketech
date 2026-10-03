class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.6"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.6/zshrs-all-v0.13.6-aarch64-apple-darwin.tar.gz"
      sha256 "4312b67598699b5ff315b8d32256af7e1ae6acfca08ca65389c7abe29648da71"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.6/zshrs-all-v0.13.6-x86_64-apple-darwin.tar.gz"
      sha256 "c20ce18ff0792aa1097e59ef0158cc11389a9a6df2d13bf2ca6571c2f6f0c6bf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.6/zshrs-all-v0.13.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "43d5b00eac70b8f0da17483f091a9fffd7825700120421651ba649c25db49b88"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.6/zshrs-all-v0.13.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "adbf8885ac69ae2ee9309256ebc9475874700a25d67c84d026d697e5ba031ed3"
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
