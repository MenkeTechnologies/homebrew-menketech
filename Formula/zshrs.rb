class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.18"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.18/zshrs-v0.12.18-aarch64-apple-darwin.tar.gz"
      sha256 "cb73cb2b14af5238d4b6fcb580681a91675c88c7fbf6f2acd9d554167df2c856"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.18/zshrs-v0.12.18-x86_64-apple-darwin.tar.gz"
      sha256 "f27e01fa914cce8024b84a92d6c289ef96596412c518b7b8d52187500e7bd750"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.18/zshrs-v0.12.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "827cbbdd58ec7399bd74a301952d2e68d21c077c26475ad865712fa2cdead644"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.18/zshrs-v0.12.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ec8a4c5f2cab240bf836ff9faabab9712d4b38ceeb92df6db736972e108f5e78"
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
