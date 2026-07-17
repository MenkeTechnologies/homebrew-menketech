class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.17"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.17/zshrs-v0.12.17-aarch64-apple-darwin.tar.gz"
      sha256 "9a40a0ab06654d1e3ca27f4b1edf88ec85803c57b9cb4371110271acb868c8f9"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.17/zshrs-v0.12.17-x86_64-apple-darwin.tar.gz"
      sha256 "a6bd9465e6ea293280f7c89a76ed0daffdc78cd62210f92662e1752404e4be64"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.17/zshrs-v0.12.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c72d6d4c6ce704a8dbd76f695d1cf39760d3215b0029f983abd0623d28c519af"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.17/zshrs-v0.12.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "03c3d6f4e46bad80a6f795c15fc20b01f696f8c22f8f6efc459ac1f371304b43"
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
