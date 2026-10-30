class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.57"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.57/zshrs-all-v0.13.57-aarch64-apple-darwin.tar.gz"
      sha256 "d0e72ce1a45f207157a02c4896f9080f9c97e56b54a43e6423f2b579cfa0f5b8"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.57/zshrs-all-v0.13.57-x86_64-apple-darwin.tar.gz"
      sha256 "83765d7bc9b61142c938b1934a8a364991479597dec05ad143a5ec94c2cd6bf3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.57/zshrs-all-v0.13.57-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "80e462ff5b96464da848f09035aa3ea02f0a9c0d72a5a8b699177f85d6cf01a1"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.57/zshrs-all-v0.13.57-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "81e47f46f8de1b0ad91104bcc9f25b4ee1169596b2081e6c833bcc12e64d0c3f"
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
  #   zshrs-all-v0.13.57-x86_64-unknown-linux-musl.tar.gz  sha256: bce61db92570570c598735302b78e85d97dae10218564b02bef5f3d06e83408c
end
