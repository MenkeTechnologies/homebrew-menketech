class Phplang < Formula
  desc "Compiled PHP runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/phplang"
  license "MIT"
  version "0.2.15"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.15/phplang-v0.2.15-aarch64-apple-darwin.tar.gz"
      sha256 "f272eea39e4829417fde6d05002ff9eef45a1bd75e518afa5d6d8960156e3567"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.15/phplang-v0.2.15-x86_64-apple-darwin.tar.gz"
      sha256 "3e4082735bf45e156623dee96fb53f37e17a16bb24d2b2654b99255ef0dd5c50"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.15/phplang-v0.2.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9d364c045d8bb9d3fa0eb852f03ccb7f2a8027ff2762bd52018f2fcf4327d3bb"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.15/phplang-v0.2.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ed22c8ac0b8e1166712f620b1b9ad4f5bd20d8c8419f49966d05527e0ba24dd6"
    end
  end

  def install
    bin.install "php"
  end

  test do
    assert_match "42", shell_output("#{bin}/php -r 'echo 6*7;'")
  end

  # Static musl tarballs also published at this release:
  #   phplang-v0.2.15-x86_64-unknown-linux-musl.tar.gz  sha256: dfbc224d25081cc2e3d50bf04a143ae7680de54c02955b49864849f09f80095d
  #   phplang-v0.2.15-aarch64-unknown-linux-musl.tar.gz  sha256: 06ffcc754db58f6be4ca9a94a6a4ba80d23adff9cea801a96d056dd6cf5f559d
end
