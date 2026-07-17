class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.16"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.16/zshrs-v0.12.16-aarch64-apple-darwin.tar.gz"
      sha256 "0f0e10ed97159c40b01daa7a5123220e3e00e07411506cf74d7d328cbdf9cb1b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.16/zshrs-v0.12.16-x86_64-apple-darwin.tar.gz"
      sha256 "b772c89fe612aa200cf684f680c245095c243fbdc18185d4cefe0374cefa7943"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.16/zshrs-v0.12.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "20809457f4a7b56405abb0624e9113f823f29ee88155d82b8b0d2ae13f24c6ae"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.16/zshrs-v0.12.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7e55018850a97496657c646d8f71bdfac35ab4237099795614da062596e0cd15"
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
