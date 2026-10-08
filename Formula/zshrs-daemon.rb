class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.13"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.13/zshrs-all-v0.13.13-aarch64-apple-darwin.tar.gz"
      sha256 "0d88ca2fdd881ba6063fdea3c398ad74949639eb9286fd8edf75f863d1068bf4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.13/zshrs-all-v0.13.13-x86_64-apple-darwin.tar.gz"
      sha256 "d92d9407b0572a9ff75daa557b9f35fc1536a29d4bb0c7c98bea3a378378d10e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.13/zshrs-all-v0.13.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f9d84f87a32a75c7d8fbc1f309f74dc4b57aa5144c828c854deeadd2a390f325"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.13/zshrs-all-v0.13.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a4367dc8ce714f86a68499589c74b9b863e304dd6d91486eb0706c33a5f54a07"
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
