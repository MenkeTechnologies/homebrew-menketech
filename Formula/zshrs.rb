class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.4"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.4/zshrs-v0.12.4-aarch64-apple-darwin.tar.gz"
      sha256 "c050c132bd13c1755920dbeeb21ef2a9651bf61c140dea8b0233f8cd4d1cbae2"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.4/zshrs-v0.12.4-x86_64-apple-darwin.tar.gz"
      sha256 "59039cda2b8adfab3fb50869c172fb075502fdab33c0b04096cf813501d73a87"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.4/zshrs-v0.12.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ba82b9924b75d77da89ff7fb8cb4c35d2259994bb25d103379aea1983f060386"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.4/zshrs-v0.12.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8907428e91bb0e8785cd9117fef37da862fa900059327da52542a95170952245"
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
