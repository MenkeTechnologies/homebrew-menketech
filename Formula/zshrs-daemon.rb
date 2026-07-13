class ZshrsDaemon < Formula
  desc "zshrs daemon + zd client only — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.12"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.12/zshrs-all-v0.12.12-aarch64-apple-darwin.tar.gz"
      sha256 "2eacdaa75971b3bb717c425f2bce2abb0684b039492a906f3c1dc46f02942fb7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.12/zshrs-all-v0.12.12-x86_64-apple-darwin.tar.gz"
      sha256 "75d9b9ccde75d839f76d485f78cfbc93abcb22b00b810e117cf3879495231289"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.12/zshrs-all-v0.12.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ebe2a74690496340dbb62562b499a8926b6e6e6aa11669356e179d7a762ec641"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.12/zshrs-all-v0.12.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ec4920ac59844969d21a87d374b4149ddfaec90e9ca17c7b237b4d8d9f99bab4"
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
