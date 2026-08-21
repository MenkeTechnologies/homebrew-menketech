class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.36"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.36/zshrs-v0.12.36-aarch64-apple-darwin.tar.gz"
      sha256 "d458366c6561f45457d57d564239c8912b6534b04af0065cfa64cffca7928903"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.36/zshrs-v0.12.36-x86_64-apple-darwin.tar.gz"
      sha256 "361046e6eb0908a54fc59e3a46fe5df879135d2f3e55a42d2c699f5f2b866c46"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.36/zshrs-v0.12.36-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "885376827194a6da0735ff872bacacf6a5a155f9f620d314d00fffe8841700b6"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.36/zshrs-v0.12.36-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "de4392f138eea9a67ca6aa15accf84270a0bf5b3444fde3ebab697ff17810bcc"
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
