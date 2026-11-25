class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.83"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.83/zshrs-all-v0.13.83-aarch64-apple-darwin.tar.gz"
      sha256 "b6fb879fe6bf00ca2855bcd053eb46b768a564bd09c6f0902f084b73f0cbd7bd"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.83/zshrs-all-v0.13.83-x86_64-apple-darwin.tar.gz"
      sha256 "4688f8b0e7e9944ddb5108a01dacc9c9058f14c646c93821c6af33174e926abb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.83/zshrs-all-v0.13.83-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e348700558a0cc9ca15edeb268ce46745a481996a7e6634cdadeb88112debc23"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.83/zshrs-all-v0.13.83-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "75550b2dd6e9730b1c115c97bb3259b5126255753b84f6ff46063ab7ca3ece8c"
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
  #   zshrs-all-v0.13.83-x86_64-unknown-linux-musl.tar.gz  sha256: 87c574f843b4f9b60d4de8539a18aa71fd0f2d80d7416ee1db7737e0a59a5772
  #   zshrs-all-v0.13.83-aarch64-unknown-linux-musl.tar.gz  sha256: 41a6b0ad5b1f73e601f865d99f01ef29c29d962f770f83fc4aae3916e320e410
end
