class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.81"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.81/zshrs-all-v0.13.81-aarch64-apple-darwin.tar.gz"
      sha256 "4948c627c926aa664640e9fc658ba31b459854b02926d758dd703b3f14c46690"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.81/zshrs-all-v0.13.81-x86_64-apple-darwin.tar.gz"
      sha256 "a2261e8bb5b82c48d2e082cadddbe01bb894196e6eb698329a9d022b1f1a5dc6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.81/zshrs-all-v0.13.81-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "57fe257ac7bbc00d013c8a1505761efc0316e823e2c5518759e59d08b94d41b8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.81/zshrs-all-v0.13.81-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "889ec043d527b1a56cf80fb83fefcb9e97da20169726fc419363448583a9454e"
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
