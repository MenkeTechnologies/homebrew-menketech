class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.9"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.9/zshrs-all-v0.12.9-aarch64-apple-darwin.tar.gz"
      sha256 "3e4ec9eb9668632a9d8967601b35a6a5bd816b3acb425538b96f5217aad8888d"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.9/zshrs-all-v0.12.9-x86_64-apple-darwin.tar.gz"
      sha256 "81230a359ef227c61942aae46d288e8ac173346d6dda6335df2612e8abd22ff9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.9/zshrs-all-v0.12.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1fdc0126ba7a91c1133b864b539ad45f715424f0833812ca2ee3bb49998f2e4f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.9/zshrs-all-v0.12.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "faa6b49b772c713a59fea91afcdfe45fc563f006593bbaae243b1d36de607768"
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
