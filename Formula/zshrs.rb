class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.30"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.30/zshrs-v0.13.30-aarch64-apple-darwin.tar.gz"
      sha256 "257a35f6b35608671c74b4645d75d82950377172d12a74708a019ff9ef79d5b4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.30/zshrs-v0.13.30-x86_64-apple-darwin.tar.gz"
      sha256 "592bebebb42ecc353091e8635342fdc739da4754b231ddff06f81ac8b1d04fd1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.30/zshrs-v0.13.30-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5f202a0f5591a74ddea0bffb8d87a324d15874967682c7872e89865cbab6892a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.30/zshrs-v0.13.30-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f06e4de9195e60120a5c80bd306460969f3880298acde149b81f50143c9ab67c"
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
  #   zshrs-v0.13.30-x86_64-unknown-linux-musl.tar.gz  sha256: 3e6b255bc3abbccab6f748de104d3213047085c19377a94a2dc8ce87c2b6a8fd
end
