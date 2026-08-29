class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.41"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.41/zshrs-all-v0.12.41-aarch64-apple-darwin.tar.gz"
      sha256 "94667da3c73417c987d7f85e0b4fbc9b0080c8c49a5d51564e62477b8224ed92"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.41/zshrs-all-v0.12.41-x86_64-apple-darwin.tar.gz"
      sha256 "5c542a3b1c6de1bd83a15ffd20a982c950de75ace09da5759085c6a11ee4f9c5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.41/zshrs-all-v0.12.41-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "69d9f1f6fc9aff87720ec3019e8e5469c82b9d2a8b266b7c04bac4c97593b869"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.41/zshrs-all-v0.12.41-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5f163d93c985435fe20cf32103ad1f1b3d10d03ef5979a9c7b7df3f1a6c89acc"
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
