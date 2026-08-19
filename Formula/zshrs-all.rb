class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.35"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.35/zshrs-all-v0.12.35-aarch64-apple-darwin.tar.gz"
      sha256 "e306ff36b2db4f7b34fa9eb8d8177e0eb2badc4d9086af8953ca31b3b242cbce"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.35/zshrs-all-v0.12.35-x86_64-apple-darwin.tar.gz"
      sha256 "48cf01a8f34ec54d8e6ad0ddac5e8db301cbb9502de7359ca186fc0852a4a8f7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.35/zshrs-all-v0.12.35-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bdfc6a0484acf7a0a71b16b7700e9ef0fe2be49319f3f01f157752d4f2a61333"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.35/zshrs-all-v0.12.35-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a408494bc05261a4e5bc9ddb905759f6230918a127f7b89846d7e0d22d3a65ee"
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
