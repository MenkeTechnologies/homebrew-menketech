class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.42"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.42/zshrs-v0.12.42-aarch64-apple-darwin.tar.gz"
      sha256 "3dcc88201348a045aa60b6b3aa476c3e611399ab1431910862ddc013eedd856b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.42/zshrs-v0.12.42-x86_64-apple-darwin.tar.gz"
      sha256 "a1c85a650bc2adc696b3dff1f8219aea7b05b436019ce3eabb9c34df1c5342fb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.42/zshrs-v0.12.42-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "03f125563cdbf73c38a5e533fd898df51436bb15c1f92533de0c58f3b0ce2bec"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.42/zshrs-v0.12.42-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bb9b2fef50992249f288902ae3cde9145e351583a0414373327abebe23abfd9b"
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
