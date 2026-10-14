class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.43"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.43/zshrs-v0.13.43-aarch64-apple-darwin.tar.gz"
      sha256 "7af2f4e83e47b4cdf5640936b64c9e495d072fccd881e01d2dbdba65b0971c18"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.43/zshrs-v0.13.43-x86_64-apple-darwin.tar.gz"
      sha256 "96969c2c48b0fad00cb4ad5de76135a813e9b433aa04730663c6817949512551"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.43/zshrs-v0.13.43-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6d01f1b55ed8906a749589905867d8c767c5a8cfc0fd5ba203856b81270edc38"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.43/zshrs-v0.13.43-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "82abd93f69ff1bae7ef04c57c5134c7c3fe73a659041e60afa898778e7932c7a"
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
  #   zshrs-v0.13.43-x86_64-unknown-linux-musl.tar.gz  sha256: 8a4ea6fe640a420244865c5671b4d5e100f49d712b61f5d6639c2bd96df31fe7
end
