class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.44"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.44/zshrs-v0.12.44-aarch64-apple-darwin.tar.gz"
      sha256 "59cf7102bb80aeb8869517e39dfa348a3bcd5e2f1da00c1b6fa15576e08674d9"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.44/zshrs-v0.12.44-x86_64-apple-darwin.tar.gz"
      sha256 "00267fcbf777398b5672dd1e2523b95120783823e84bf24410cd074c52c99b06"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.44/zshrs-v0.12.44-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3ef66f293e50160f483e5c5eb122d7fdb65dcaeb4cc1c723891d36cc8d4d2864"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.44/zshrs-v0.12.44-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2c47c79f7f58df6daa11e95ec91435a2278d5416b46c77528f26e9de31ad21be"
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
