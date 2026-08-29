class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.41"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.41/zshrs-v0.12.41-aarch64-apple-darwin.tar.gz"
      sha256 "5552311c42896a248c1aa8d8e933a62ee872fb0a55c854179d26ca73425c2138"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.41/zshrs-v0.12.41-x86_64-apple-darwin.tar.gz"
      sha256 "44e37f5514220ff3aef336b6128a896d889e592af14d76308bdcbae515542ceb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.41/zshrs-v0.12.41-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5f92a2223ebc2e59447a92f1f1e6018eac041fb0eecbf785b2d65e9e9a6ab459"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.41/zshrs-v0.12.41-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9a312a820f7493b70cd11680dc7da2c50545252d5117781471ea213d62bb278e"
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
