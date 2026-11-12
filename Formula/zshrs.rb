class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.63"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.63/zshrs-v0.13.63-aarch64-apple-darwin.tar.gz"
      sha256 "d3edf95b00df2c3a4b7ff5c35f2bdc5d43afeeaaa9e62ced3c3767073dd55139"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.63/zshrs-v0.13.63-x86_64-apple-darwin.tar.gz"
      sha256 "1878a9a0719414a68afb8c861b29924d0b2caa4e6df443c65a22efb615627ab0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.63/zshrs-v0.13.63-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "78ad29f9257088bb1979a04d3564179465326179683b0020aae7cd6aafb5cc49"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.63/zshrs-v0.13.63-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "606d3338c0b7acd5c063cc9c064e6560817f18a82bb5055ed9a181e6f10a8c46"
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
  #   zshrs-v0.13.63-x86_64-unknown-linux-musl.tar.gz  sha256: 1ed48f57e7e58a88c65c5d22353f5a454deb49b829ac2f291956ee90cde01ffa
end
