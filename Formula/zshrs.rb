class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.32"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.32/zshrs-v0.13.32-aarch64-apple-darwin.tar.gz"
      sha256 "94bcad63aaf195f1022e40e56e2ea98c9601fd12ccbc36e098fccdde654e9522"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.32/zshrs-v0.13.32-x86_64-apple-darwin.tar.gz"
      sha256 "634b4b26f305bd75ec28af5393807954ae536367e4a21a17da3489b3faee28d8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.32/zshrs-v0.13.32-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "151ba7773edc2721ed5f7008275d512432fbf4db06755cf4a718433dd0567cfa"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.32/zshrs-v0.13.32-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "35b18565b1d543dbbc27d0d12632706834ce90d6ee6ff25ad5ae8a2e702a77ad"
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
  #   zshrs-v0.13.32-x86_64-unknown-linux-musl.tar.gz  sha256: 135b9371153f330a8c8bf4992324c8d230334f184640ad0329b06bacd6b3680c
end
