class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.48"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.48/zshrs-all-v0.13.48-aarch64-apple-darwin.tar.gz"
      sha256 "36e4716cf8ec186adcaca27c3591b4ced830261e13901768037f3973a7227272"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.48/zshrs-all-v0.13.48-x86_64-apple-darwin.tar.gz"
      sha256 "ccbcc25c435e6d23869d8410f4920025d12ffc10ecca96600f7813e06406fb81"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.48/zshrs-all-v0.13.48-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b3de890827d91fbac7070e64ebb48ea74f622b56c9f5e14b04f54b56573e59b1"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.48/zshrs-all-v0.13.48-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8de90bb15a1a9bfe996d1f1c9ec1a573e44005ab08371a728b14be87a6d4c9e5"
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
