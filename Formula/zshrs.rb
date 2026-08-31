class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.54"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.54/zshrs-v0.12.54-aarch64-apple-darwin.tar.gz"
      sha256 "e1e0611270e65360214da26f7016a88b203ef99ed99f94b5fd1d663f55fca715"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.54/zshrs-v0.12.54-x86_64-apple-darwin.tar.gz"
      sha256 "5ae6b792d62e53a2ddb9a2aaf178695c2182eb0e46a3e5ae51ad766a40e9299d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.54/zshrs-v0.12.54-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "52af2b5239435c1e5af029c16688de2be0e6d73a322bfa77f1d8e77723fdac33"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.54/zshrs-v0.12.54-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "528d6f8e2200c796563f4692b2318baedde7f5f86c75ae2fb37b1c744eb72656"
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
  #   zshrs-v0.12.54-x86_64-unknown-linux-musl.tar.gz  sha256: 68488a264ec4d7913c5bd20818866e5e98d7017a5e067596d35e0242a905b7ed
  #   zshrs-v0.12.54-aarch64-unknown-linux-musl.tar.gz  sha256: ad68f48479c9e866ac94c5aa80f975586139f580fcf052aa9713ca1b549d617a
end
