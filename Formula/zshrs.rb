class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.11.41"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.41/zshrs-v0.11.41-aarch64-apple-darwin.tar.gz"
      sha256 "2d52e793d31070bae17062a348639db152735a7eaa6fa54ad8762ef8acacc9b7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.41/zshrs-v0.11.41-x86_64-apple-darwin.tar.gz"
      sha256 "9962c0b8a68b3395159c2e725b51016957f547e6af9368df7059d88df172a6b8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.41/zshrs-v0.11.41-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "784e3a4c2eb1923b85516e2792a99b405ff1a894c53f3531f57df1572fbe401d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.41/zshrs-v0.11.41-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "62c8fc45d841a853dded509bceb734d4b245616976fa5d5faa7c74f8dec25be4"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end
end
