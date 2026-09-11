class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.61"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.61/zshrs-v0.12.61-aarch64-apple-darwin.tar.gz"
      sha256 "ddf54ad1378e76082ecb3a29c5b09e73e480442af5c1f2799920858c11a13f80"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.61/zshrs-v0.12.61-x86_64-apple-darwin.tar.gz"
      sha256 "8beaa206e5f8061bdd5761fde1eb69fa380aa74aab06d6cd286c6343a5bd04df"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.61/zshrs-v0.12.61-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f67e2b4db2460ea525182939985b23163599c1942c95ec27283c0b776e1c38cd"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.61/zshrs-v0.12.61-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5a1fc2a9bb6e72b012793553250eb3cef7cae47f981770349856348f0de224c9"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-v0.12.61-x86_64-unknown-linux-musl.tar.gz  sha256: 665eeab183c5facf49e811e5d9c82ad01bc4f8caf3bffa90a771248aec65724b
  #   zshrs-v0.12.61-aarch64-unknown-linux-musl.tar.gz  sha256: 657645a05bbd4ffa6e0d7db19d8edaf0af9289b53227057ac0c1bbf86c3c7803
end
