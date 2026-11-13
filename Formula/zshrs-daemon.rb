class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.69"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.69/zshrs-all-v0.13.69-aarch64-apple-darwin.tar.gz"
      sha256 "d222aba43ad875c1ec7ffab83fe98f4dd92baf6609d845e027729ad58da631a4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.69/zshrs-all-v0.13.69-x86_64-apple-darwin.tar.gz"
      sha256 "82d0707147a8dc8fa733f44dbaf340e56d1df85049b7c19cd364aa68e966f6ad"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.69/zshrs-all-v0.13.69-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c4bb6a4769a807fed2aace642ffbcf31aab494c97eedcb6b38d9ccf101254c68"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.69/zshrs-all-v0.13.69-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "157b35704dd60b371a8f07ebd68402d874601306781a5637915e7e8d015934c2"
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
