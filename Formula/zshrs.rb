class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.65"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.65/zshrs-v0.12.65-aarch64-apple-darwin.tar.gz"
      sha256 "c083845f7d30bf17b14cfd2ed4a370a6b41e00e397392f04d698f674e3ef0d42"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.65/zshrs-v0.12.65-x86_64-apple-darwin.tar.gz"
      sha256 "730513c32ab56af04ec8f2b9f4e3a7b9afcbabeb4451a53644e595a2b4731600"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.65/zshrs-v0.12.65-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "824a9b864712086466ea484f5f00509003c008527e52666f651ef3795898b77c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.65/zshrs-v0.12.65-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "90404ca5fa5f1eeb797eec316e5a30f587f7e4df37f119769bf20b7708789611"
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
  #   zshrs-v0.12.65-x86_64-unknown-linux-musl.tar.gz  sha256: 56715f2a06f72b18f05539175a1a5c92dac9db842e81e59a2541856ce2e6e7e2
  #   zshrs-v0.12.65-aarch64-unknown-linux-musl.tar.gz  sha256: b8d91e9b209cf082e91cdc72e9c3c47515e2aa85d4a81a4c391c1a65d828b3b0
end
