class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.15"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.15/zshrs-all-v0.13.15-aarch64-apple-darwin.tar.gz"
      sha256 "42e6e1116377e39b8afb888fa6cfdea4a99a61ce649b05bf5a181f713fc7a248"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.15/zshrs-all-v0.13.15-x86_64-apple-darwin.tar.gz"
      sha256 "d5bd89ba26ebc1757c05af2a7cbe31d2717535fb1308ca3d7cd22be0e15449d5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.15/zshrs-all-v0.13.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0cf296492c92c3eb74845c0a93a06f430de1593262b0efab056b81f8d88e0bd2"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.15/zshrs-all-v0.13.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "343a132e620d7a8384c52ec8639fa28e80a2a970776d44fd2bb8fe267066704e"
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
  #   zshrs-all-v0.13.15-x86_64-unknown-linux-musl.tar.gz  sha256: 4daa2006ab631621e5158b5345fc3d27d545908abac39e6a3f14ae5a58c3669c
  #   zshrs-all-v0.13.15-aarch64-unknown-linux-musl.tar.gz  sha256: 12a43f5d8055a74dc66e5ed118e960a2f1369017850edc6dcd6fadf637e718ea
end
