class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.38"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.38/zshrs-v0.13.38-aarch64-apple-darwin.tar.gz"
      sha256 "0fddee7b8cf0bc0c9db934e61d82c584fce85b642e1e29dc7fab212a744ff02a"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.38/zshrs-v0.13.38-x86_64-apple-darwin.tar.gz"
      sha256 "2ec7c2c92c31374950d75b58fccfa92da2d595903affe90af372178e6f6fa2ae"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.38/zshrs-v0.13.38-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c74bd8d75e98d1978372e9b25310c815b9abde88b1b65c72a9fb89e3b34032fa"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.38/zshrs-v0.13.38-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "060424ae44b0c228620f76fa200c2b991cda834e0108e55862628478d79a1c7f"
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
  #   zshrs-v0.13.38-x86_64-unknown-linux-musl.tar.gz  sha256: 2239d59b5c1694cc383f3d3b356a06adbcc03d5a96412b0e3676508aeca85be0
end
