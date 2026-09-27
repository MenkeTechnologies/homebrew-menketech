class Phplang < Formula
  desc "Compiled PHP runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/phplang"
  license "MIT"
  version "0.2.12"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.12/phplang-v0.2.12-aarch64-apple-darwin.tar.gz"
      sha256 "d09b3228dfc4df94635758b679a6ee5693fb0adc1fb60f679f8de71f6ab37186"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.12/phplang-v0.2.12-x86_64-apple-darwin.tar.gz"
      sha256 "ea67ed0ef3320fa43f4cc66adf78ec3c8a12fb63756aab0d8e7ba85b4a46e50b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.12/phplang-v0.2.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f155d63885a3de41c2482e936df4dbd3e78f82cdb388da4a94da60f521ed2cd7"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.12/phplang-v0.2.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1bf7e56caf3bc8e1b4d56d632d09a90b9ea25c7e4cee824ebdb81978b3394888"
    end
  end

  def install
    bin.install "php"
  end

  test do
    assert_match "42", shell_output("#{bin}/php -r 'echo 6*7;'")
  end

  # Static musl tarballs also published at this release:
  #   phplang-v0.2.12-x86_64-unknown-linux-musl.tar.gz  sha256: d321f2769b787ebba0950fe45e0c2d0fd1cc5e9dc2baf1a5a26ab5b93d45512c
  #   phplang-v0.2.12-aarch64-unknown-linux-musl.tar.gz  sha256: 4a7768073eff0617e196a1b68e2404b4085a9192bcde023d186e992fc569d4f0
end
