class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.28"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.28/zshrs-v0.13.28-aarch64-apple-darwin.tar.gz"
      sha256 "445e56d545bb50c159e9edfbcb5ba0858a3ddeb2455e67b8c2453fbed50a7d2a"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.28/zshrs-v0.13.28-x86_64-apple-darwin.tar.gz"
      sha256 "f6ff770b2c3bf02b10ad77577897d6c5bc86a748f2ce7ac6aac10bdfd2738e79"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.28/zshrs-v0.13.28-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7de42000377e9c3aedfe19a074ee9b7089d937612586727eeec3643b9ff98a5f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.28/zshrs-v0.13.28-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1a0edcb07b83982bc421f0aa4389f8c50e6f2ed955def5164b8609dbf826b6cf"
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
  #   zshrs-v0.13.28-x86_64-unknown-linux-musl.tar.gz  sha256: 311cc9513202a5217f42d13e366bf187d3b39844d9c8e2c67fa295d9d5b20dd7
end
