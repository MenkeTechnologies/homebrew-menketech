class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.77"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.77/zshrs-all-v0.13.77-aarch64-apple-darwin.tar.gz"
      sha256 "7b14c365789f009fb9094cdc1a18c3ae0734a418d7be5ad99bca1f7a2f7d812a"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.77/zshrs-all-v0.13.77-x86_64-apple-darwin.tar.gz"
      sha256 "de413108eeb96e7be23bf39b6e598295a421e2947a8947cce6d042a1ad0c8e2a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.77/zshrs-all-v0.13.77-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e21a5011d8c97ce9e624add7c81842f321bad60d200e2335c6d50cde44c4404"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.77/zshrs-all-v0.13.77-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7ef06f499acfc4bb1177f3fa36e346f07ceacde896156f2106a989fb629bd17b"
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

  # Static musl tarballs also published at this release:
  #   zshrs-all-v0.13.77-x86_64-unknown-linux-musl.tar.gz  sha256: bb002c886d7c5691648e160ae383eb67ad511b0742a0562bb684ea865fda636d
end
