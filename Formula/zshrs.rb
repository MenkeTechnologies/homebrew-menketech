class Zshrs < Formula
  desc "The first compiled Unix shell — drop-in zsh replacement with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.11.20"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.20/zshrs-v0.11.20-aarch64-apple-darwin.tar.gz"
    sha256 "20c5511a79f65717c8081ba4d9f70c000b7c9273890f0c3ad4628e765a6c8160"
  end
  on_intel do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.20/zshrs-v0.11.20-x86_64-apple-darwin.tar.gz"
    sha256 "b9c52a48425c31639781efd9286eefa75bb85d40d5d4c55f13d70da28cebe5e6"
  end
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.20/zshrs-v0.11.20-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d4efd37dbd7c3fc1d6a7c3e332971b4e9e7a0d39c714b691799f1e485e8d5d5c"
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
