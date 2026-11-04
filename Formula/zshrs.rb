class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.61"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.61/zshrs-v0.13.61-aarch64-apple-darwin.tar.gz"
      sha256 "74fd408d3212241d325b17b4d3343d286d16c60ce1934c8934c504a11b32484a"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.61/zshrs-v0.13.61-x86_64-apple-darwin.tar.gz"
      sha256 "3b6f82b27a7417952fd07fdc92b824f8a45932c1e5b47bb7992a1b52bb70bbe7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.61/zshrs-v0.13.61-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2cab7017243a5a57a0f0721270ffa28c7d52f22d90fedfa0b696be077148cab9"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.61/zshrs-v0.13.61-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6c3e03c35eccbf195cdcb9f9209a2d16e01effd7e7f7b236fa6d8727d98ba878"
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
  #   zshrs-v0.13.61-x86_64-unknown-linux-musl.tar.gz  sha256: f161970e0b73c95681195f15edabd2590de13df8e934aa032533db0767b14f71
end
