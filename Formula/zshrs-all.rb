class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
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
    bin.install "zshrs"
    bin.install "zd"
    bin.install "zshrs-recorder"
    bin.install "zshrs-daemon"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
    assert_predicate bin/"zshrs-recorder", :exist?
    assert_predicate bin/"zshrs-daemon", :exist?
  end
end
