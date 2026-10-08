class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.12"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.12/zshrs-v0.13.12-aarch64-apple-darwin.tar.gz"
      sha256 "8cf0d9f72e58b8aeaf017dc60fe6e042f43b476932288feb454ba369d61fa587"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.12/zshrs-v0.13.12-x86_64-apple-darwin.tar.gz"
      sha256 "c823f3e9cf2a65d5e7e0e0b06123c347fd8858e5ab79c4ea00bd6aed51e4fc13"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.12/zshrs-v0.13.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a3ab70fb49b6d1fe6a16c26cb7df03ffe2d769634bef291ee650352b81b6cad8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.12/zshrs-v0.13.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c730475aa57459add7fc9b115369f304d7f7a7194d981aa4f43b546329750685"
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
  #   zshrs-v0.13.12-x86_64-unknown-linux-musl.tar.gz  sha256: a3cdb34e10e31d02cf72b09ef0be62173e84d9053141e73335db18c98ce2ad30
  #   zshrs-v0.13.12-aarch64-unknown-linux-musl.tar.gz  sha256: 180e638f40f0741f4ee5691497edbc2433b4db6e07b5b60216e6f160578e4812
end
