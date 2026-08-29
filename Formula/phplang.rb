class Phplang < Formula
  desc "Compiled PHP runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/phplang"
  license "MIT"
  version "0.2.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.2/phplang-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "2c99f5df053117072b65f3752ec67008b8a6c0671b85cf69d7de6469cda05107"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.2/phplang-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "84647c49448d9ad35693bd26a1d30f9b1c0f655df104fffedcf71e9123ececad"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.2/phplang-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7216bc8edb6445b0be5e1bcf56753199036144b2a5b96d76ea4fe29ae7af7fae"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.2/phplang-v0.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6484a601cf6dc01d5b3368a4852c8f7b4af9830f0eba04a9ae909bd3e8f5d18e"
    end
  end

  def install
    bin.install "php"
  end

  test do
    assert_match "42", shell_output("#{bin}/php -r 'echo 6*7;'")
  end

  # Static musl tarballs also published at this release:
  #   phplang-v0.2.2-x86_64-unknown-linux-musl.tar.gz  sha256: fd5b2c0532bd783210134381c485e7206d16f9ccd89d8ff6e1c68298b1732707
  #   phplang-v0.2.2-aarch64-unknown-linux-musl.tar.gz  sha256: 41b8d4f7e33f204e668764cd496e6ea10c380add6b0c91a0e79bbd1b6be44ef5
end
