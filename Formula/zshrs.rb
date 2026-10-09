class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.18"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.18/zshrs-v0.13.18-aarch64-apple-darwin.tar.gz"
      sha256 "e4fa48fc6ff818793ad6f8e50e343e9ccd41ae329377543bdeb605ae21e7d47a"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.18/zshrs-v0.13.18-x86_64-apple-darwin.tar.gz"
      sha256 "533646cf99d3af31509f99a868835a5a902944b275a2a488e2d8613b0e4ea749"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.18/zshrs-v0.13.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "47fb2119216b381245a1d11842de3397d415628f766412ec441ff444466578ce"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.18/zshrs-v0.13.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "28906cc53a7ef80042dba829d6c5002da3f80c47768b9610aab9b3f92073cca3"
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
  #   zshrs-v0.13.18-x86_64-unknown-linux-musl.tar.gz  sha256: ee062db2c90a6db08284c52521fadfb306a696a47943d691d2a0e5971bfc81a2
  #   zshrs-v0.13.18-aarch64-unknown-linux-musl.tar.gz  sha256: bc048e9e678fab06ebace819c60bf0702b98ac4c7f713c5ee297e2a9f125b66a
end
