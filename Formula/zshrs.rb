class Zshrs < Formula
  desc "The first compiled Unix shell — drop-in zsh replacement with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.11.18"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.18/zshrs-v0.11.18-aarch64-apple-darwin.tar.gz"
    sha256 "f219ed45da4972f0164208a1990484e1d17797a3109e10e97379d0eb8ff4f27b"
  end
  on_intel do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.18/zshrs-v0.11.18-x86_64-apple-darwin.tar.gz"
    sha256 "749cc914e236926f1c7309de28caba974ba531d9ef8f1ceb0b03885f19c0d8bb"
  end
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.18/zshrs-v0.11.18-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "9b0bf3895d934e6954d1cced0f415934ddd515e53af1033d770c1c5f70373464"
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
