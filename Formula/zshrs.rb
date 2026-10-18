class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.54"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.54/zshrs-v0.13.54-aarch64-apple-darwin.tar.gz"
      sha256 "d617bc234acaf3a9548fec5c72b2fbe4864f75e202381d390c070e155d0888d2"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.54/zshrs-v0.13.54-x86_64-apple-darwin.tar.gz"
      sha256 "4ee18b1bfd288eca529e03f7e1040bcfbf36dfe0d94935cf25a3c724dcec2d95"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.54/zshrs-v0.13.54-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d972e4240021e6511b051b4eacadd17664f9e6fe10ef40bdbc933a19e8d469ad"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.54/zshrs-v0.13.54-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3e47e4ff65104e437acbcc07666110716c9058f0fba059225057e2317e545f0b"
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
  #   zshrs-v0.13.54-x86_64-unknown-linux-musl.tar.gz  sha256: b00fdfa15e4c0ebe990ff13f1ba5a219451865afdab7079d4d075332430c1295
end
