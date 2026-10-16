class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.45"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.45/zshrs-all-v0.13.45-aarch64-apple-darwin.tar.gz"
      sha256 "5e5b42e413c3da8990d5ae6329456a186bd96593280084350d938ee2dd530bca"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.45/zshrs-all-v0.13.45-x86_64-apple-darwin.tar.gz"
      sha256 "a0fe913caab2c572db38d757f9fe24768de6ec64b842e3783f9a3587295febba"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.45/zshrs-all-v0.13.45-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c57560a018cae39e0e26885f2acbdec79e6a8a93623c38e74eb0f830a21c3bb3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.45/zshrs-all-v0.13.45-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5b79b9af941be85db915e935410f52cd87aca7a8c5ef7ecfb3b31f95796a31a6"
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
