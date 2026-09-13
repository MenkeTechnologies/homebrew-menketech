class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.64"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.64/zshrs-v0.12.64-aarch64-apple-darwin.tar.gz"
      sha256 "21cc6aef4b43c02b733e39a407d196478761d49663ef0452fab307378c08c8da"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.64/zshrs-v0.12.64-x86_64-apple-darwin.tar.gz"
      sha256 "2c1705d9e7701b7f3526a6af8ca23a649b36e90e1f704feaafba663ba27a8fb9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.64/zshrs-v0.12.64-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a1ca823dd9e669fe3de534888ab376acec502c7067fca92319480d71abb6f90a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.64/zshrs-v0.12.64-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2328576dfb3187da35eb740d4b74d7f9b273ad3da2ec750995afb4bf138170dd"
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
  #   zshrs-v0.12.64-x86_64-unknown-linux-musl.tar.gz  sha256: 4b098b77baa2a6e0ba5c7ac84f7ffa889cee6bb751f6fc8b52c0125e13fe457f
  #   zshrs-v0.12.64-aarch64-unknown-linux-musl.tar.gz  sha256: ae1494b70c9509067ed95ff6a337551f3a434738b8a2839338de2caeb73b1116
end
