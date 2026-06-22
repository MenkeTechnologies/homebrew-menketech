class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.1/zshrs-v0.12.1-aarch64-apple-darwin.tar.gz"
      sha256 "88e43066f8400651dbd08f8fed9ec5ed98e1237b456b7b13f8f7bbecf363abed"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.1/zshrs-v0.12.1-x86_64-apple-darwin.tar.gz"
      sha256 "8a17d112a8b05661633a0dbd5647d842428d86d6440e168f5ce1d6389508e770"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.1/zshrs-v0.12.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d007cfa36f0608f04065f6a73f29e707ea6237bae525c9053e381c74157dd1e4"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.1/zshrs-v0.12.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "04a98e342d29882de699c1ba315dda71bcfd0f495d595bc77591d6afbcc89f66"
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
