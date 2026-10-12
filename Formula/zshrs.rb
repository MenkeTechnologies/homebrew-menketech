class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.39"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.39/zshrs-v0.13.39-aarch64-apple-darwin.tar.gz"
      sha256 "ee1241a21a011da749786588624b9fe83827d7d6b8b2018bd587f4e7da1f8e3e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.39/zshrs-v0.13.39-x86_64-apple-darwin.tar.gz"
      sha256 "eb5c78fbe9933dbb1d61d08fc0d49bf30f8a84d6a201ed42d7ceab1df7d37dbe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.39/zshrs-v0.13.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "821b7caffc1f4705c76cd89ae7c30040d777c31bf0646f92be8f6197ac12aab4"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.39/zshrs-v0.13.39-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dd496642e31311a70473dba0f903937a88f70c3d3b6c09a7939550ec3233e0fe"
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
  #   zshrs-v0.13.39-x86_64-unknown-linux-musl.tar.gz  sha256: 86a82f80b9fa6cd330f925bf12ce30ff9f4af214423fd0d20cdcf8e2766be136
end
