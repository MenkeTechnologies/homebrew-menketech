class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.15"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.15/zshrs-v0.12.15-aarch64-apple-darwin.tar.gz"
      sha256 "7c3325c0cec81113f0d0b80e72ba02ec1003296341f97b7d73e1fb20bf57e096"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.15/zshrs-v0.12.15-x86_64-apple-darwin.tar.gz"
      sha256 "86127afe8a1d0c4d31fd2ade9c0f57132295b985f99c87bd0bfbc9f616e17ecc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.15/zshrs-v0.12.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aed7c9eda80d27ca0144db2b9bfbd8747170454e02a784735954b78c635a2a74"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.15/zshrs-v0.12.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "806f7f78e0e364eb53a24164be6d604d1542b52656242355f8222545aed92cc5"
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
