class Zshrs < Formula
  desc "The first compiled Unix shell — drop-in zsh replacement with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.11.22"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.22/zshrs-v0.11.22-aarch64-apple-darwin.tar.gz"
    sha256 "1dde18bad2fc371dd55591055d5bbc192f49566bb9eb16d7e15a7f75a5f7185d"
  end
  on_intel do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.22/zshrs-v0.11.22-x86_64-apple-darwin.tar.gz"
    sha256 "2e40b056d4e142feacde42e732344b4d61d85e5742493ce0545bbf7e92ab4f91"
  end
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.22/zshrs-v0.11.22-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e4da317e5ab3fa2c82b9b510ac4a165a82004effdde118eacc7e95c3815065ba"
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
