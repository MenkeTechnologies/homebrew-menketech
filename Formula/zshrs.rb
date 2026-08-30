class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.50"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.50/zshrs-v0.12.50-aarch64-apple-darwin.tar.gz"
      sha256 "5edb24150df1e33382f19b9fb254fc744371bd0ef1b9bb388fcec1cb462faba3"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.50/zshrs-v0.12.50-x86_64-apple-darwin.tar.gz"
      sha256 "1df292174ff850f96790f37e8ff844ce069f9feff1881c5c5b62ebbf3c7e35b0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.50/zshrs-v0.12.50-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9412257e9965351685d6b8832fdb9fd95be9814a5618d24d7afb6eac3af9b1d3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.50/zshrs-v0.12.50-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "248433be623d3896b03de64871de830945cb70ea0e29ccb79e1988d44ce46bf7"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-v0.12.50-x86_64-unknown-linux-musl.tar.gz  sha256: 96a6960c209b43c1562f34773dd54502290cf0ab748294878c5da52b68183017
  #   zshrs-v0.12.50-aarch64-unknown-linux-musl.tar.gz  sha256: 741bae162d9fa919648beb7cec943662e356f26668ab620e5532265ee4829756
end
