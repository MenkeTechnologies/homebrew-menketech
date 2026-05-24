class Zshrs < Formula
  desc "The first compiled Unix shell — drop-in zsh replacement with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.11.15"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.15/zshrs-v0.11.15-aarch64-apple-darwin.tar.gz"
    sha256 "325a54c0152152640d78bd7ecca24b1f42f11e1269f08e1728e06aa644137f07"
  end
  on_intel do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.15/zshrs-v0.11.15-x86_64-apple-darwin.tar.gz"
    sha256 "9ea5cbe94d8a53e67c46907ee4c98833ad3b1abb363305636475fd1af1780887"
  end
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.15/zshrs-v0.11.15-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8cd941dfcb9c347b14f6420eec78e24267e5228a2f093a6fa26e0921e4925059"
  end
  end

  def install
  bin.install "zshrs"
  bin.install "zd"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c \'echo hi\'")
  end
end
