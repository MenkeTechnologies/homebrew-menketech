class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.23"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.23/zshrs-v0.12.23-aarch64-apple-darwin.tar.gz"
      sha256 "0149fcc85c3e7215d4cb966691227d8755555aa0d80dd7ea638424996b7495d8"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.23/zshrs-v0.12.23-x86_64-apple-darwin.tar.gz"
      sha256 "a4c1aa15e1feaba7903c43655ee7e8ce0dd308d42904641a66b7215094229a33"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.23/zshrs-v0.12.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9922e495e55d4b91fc66c1616098ecb2c7de9c08a484b85ffb8648c7b33dccea"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.23/zshrs-v0.12.23-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1ab354689e743efc7d8bfbd44baf476eea0f36e587e633f5cb83193798b88d3c"
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
