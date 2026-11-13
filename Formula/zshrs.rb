class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.66"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.66/zshrs-v0.13.66-aarch64-apple-darwin.tar.gz"
      sha256 "128200b6ac40d0268b27f4347110a603354bf14b0ffec7e4f31839ce6b6e2d29"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.66/zshrs-v0.13.66-x86_64-apple-darwin.tar.gz"
      sha256 "565feccb2f0b380ef5e94b26ee7447258a0d97d42baa53e564b79e4cc0ffa991"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.66/zshrs-v0.13.66-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d8c1ba3541ce6826c6f033129db596c4c50092f5937fe450084f2b67523e9e69"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.66/zshrs-v0.13.66-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9925bcdc6adee6ddd05f6b4eacccf82cff05958e458fae053fc3d2fdae9891ed"
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
  #   zshrs-v0.13.66-x86_64-unknown-linux-musl.tar.gz  sha256: c8bc93b75603756bd8783c7ea005002f8e2e3b9a158e1bd4c3053cf03ededb37
end
