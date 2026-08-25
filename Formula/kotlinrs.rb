class Kotlinrs < Formula
  desc "Compiled Kotlin runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/kotlinrs"
  license "MIT"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.2/kotlinrs-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "08303d4b884c4b97422771e40ba61c4c0d153b2b168f0858fb411bc54e926a00"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.2/kotlinrs-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "c75f4b9843cd08f4d8c6289f5f69b62a4ed2230281a7720a1e592552514e2a5a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.2/kotlinrs-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d07a5977a42054606cdaa96c3217c576798b62c63140068462fed6444ffdaac8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.2/kotlinrs-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8f77d7a3afc4a7946cf84b25bb6d008c5f8405c5d5382326d1c21aaf89c99937"
    end
  end

  def install
    bin.install "kotlin"
  end

  test do
    (testpath/"t.kt").write("fun main() { println(6*7) }")
    assert_match "42", shell_output("#{bin}/kotlin #{testpath}/t.kt")
  end

  # Static musl tarballs also published at this release:
  #   kotlinrs-v0.1.2-x86_64-unknown-linux-musl.tar.gz  sha256: 686489c4be90177172ac36c8362cdcc3c654423f09d8a777174b5970d11b1332
  #   kotlinrs-v0.1.2-aarch64-unknown-linux-musl.tar.gz  sha256: d4c977d93f102b195dbfe4555392d84bf32c33dbbc86de341c98cb7518cf26ad
end
