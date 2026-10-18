class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.52"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.52/zshrs-v0.13.52-aarch64-apple-darwin.tar.gz"
      sha256 "6adf4c2e5d74254344439b4865eac3d858e68f0e12fa3c3757588a858eaa8471"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.52/zshrs-v0.13.52-x86_64-apple-darwin.tar.gz"
      sha256 "e1e2510e1737ea90a4feddd8a9c901024c40ddd75fcb8a5c93e8d678af66be87"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.52/zshrs-v0.13.52-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7afba68a73c6c7f50b330201f2b1775a8b691ff53557ed8b05c0c2767bf6ccf8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.52/zshrs-v0.13.52-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fc24249f720adc741b764067ae13f5f44fb022151057398a46f866f1e443913a"
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
  #   zshrs-v0.13.52-x86_64-unknown-linux-musl.tar.gz  sha256: eea3df039fb004b3d8383610e336cbcc13e7c9cd20e067441fbc39cfc05a6f9c
end
