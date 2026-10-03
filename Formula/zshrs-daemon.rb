class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.8"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.8/zshrs-all-v0.13.8-aarch64-apple-darwin.tar.gz"
      sha256 "92bd15f0bbe5c700259a7f7dfd86761b75eb661f1dcfc221edf91a242285d7cb"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.8/zshrs-all-v0.13.8-x86_64-apple-darwin.tar.gz"
      sha256 "a36214baf3eca868a51906d3bc715f1c484935a4fc210e4b598c455d7ab209e3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.8/zshrs-all-v0.13.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fa28f475c9bd2665481e4ef821ea11ccdf95281e3b8960bc78f52a41386187d2"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.8/zshrs-all-v0.13.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a6431080baaf8857eb0980cb0ce25b2b801f5e62712583ebca72e0eb29409411"
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
