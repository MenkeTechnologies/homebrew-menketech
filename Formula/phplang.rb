class Phplang < Formula
  desc "Compiled PHP runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/phplang"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.1.0/phplang-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "de3abd6570f0bcce1ef45556e282997de31ea1e8a524291d777d8b354ea850e0"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.1.0/phplang-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "8850448173065e981ced5a9dde913e21bc089ab06e669108263a1f90a78ae742"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.1.0/phplang-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e50f4f136080a7a4ae38da96624f4cf1ac8ac215e06388f22ddf8c200f8b8484"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.1.0/phplang-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "23098e51a742a8c432f0f14f0ca32b5992d3fb6170d38d285694eb9c9747c93d"
    end
  end

  def install
    bin.install "php"
  end

  test do
    assert_match "42", shell_output("#{bin}/php -r 'echo 6*7;'")
  end

  # Static musl tarballs also published at this release:
  #   phplang-v0.1.0-x86_64-unknown-linux-musl.tar.gz  sha256: 75b6aacd84e69202f8fdf376ec4f80f049b055583b94c42955d230cf9ec0f058
  #   phplang-v0.1.0-aarch64-unknown-linux-musl.tar.gz  sha256: fb61acf1cb5c1c8f9a2eddd978c1b3efe24b46ea10c9fd2efd08b233db7ad4db
end
