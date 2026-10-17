class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.50"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.50/zshrs-v0.13.50-aarch64-apple-darwin.tar.gz"
      sha256 "b1f5efad2e9d4316d71e2113330a46bafe37f39c5965ce4f2144b9f5d22e370e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.50/zshrs-v0.13.50-x86_64-apple-darwin.tar.gz"
      sha256 "c0f013bf16a31227c5b8f0defdcb85783f8dd79a82aa086ddf56b040daa51cfd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.50/zshrs-v0.13.50-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e7728e43ecb09adf7496e8d0a81d5de8776e63eec7e71b250aea3f05faf9fa69"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.50/zshrs-v0.13.50-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "23f3ddc6097d11bc46fb1e35d603cfea5b6e56b6035ea946affa788f0bf06e29"
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
  #   zshrs-v0.13.50-x86_64-unknown-linux-musl.tar.gz  sha256: 0a33b262c4f035c165a4bc5e11086f4eed0900b4ef3521456f6aeb64a04c241e
end
