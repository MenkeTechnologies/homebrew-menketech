class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.11.39"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.39/zshrs-v0.11.39-aarch64-apple-darwin.tar.gz"
      sha256 "367a69c9319af3db07e4771751458f9b16d3e8d50391e77457a63967474039ee"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.39/zshrs-v0.11.39-x86_64-apple-darwin.tar.gz"
      sha256 "b139869a1862fc3f4a88acfb762ae1450834096ce17679840e99f7e04758ece3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.39/zshrs-v0.11.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8741d7d36723b7fd1043f24bb979ef7218f4cd1f5c25e2cb8832de64ced035fd"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.39/zshrs-v0.11.39-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "541669f22ecbd10f1f6259d725e793ff67ab51be5498b4e70cd6a2c27cde8133"
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
