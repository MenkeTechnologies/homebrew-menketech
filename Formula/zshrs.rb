class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.31"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.31/zshrs-v0.12.31-aarch64-apple-darwin.tar.gz"
      sha256 "231b79654e5614e9059f67f3e17ae67b695acd2ba7bc23c1e2b8b2755ad6b7d4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.31/zshrs-v0.12.31-x86_64-apple-darwin.tar.gz"
      sha256 "b715870270685be52d798d2186207c913f9ec88e32993d8f1f5df9653d756664"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.31/zshrs-v0.12.31-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3c95bd3cc297069bb4fac96683afe0db056bb77e0c578b2a7759f42b16baf0ee"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.31/zshrs-v0.12.31-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5b1169c69eb2128ad9a60d03772cdb991a5da79d6ad2e9aae6ba3b3583e874f3"
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
