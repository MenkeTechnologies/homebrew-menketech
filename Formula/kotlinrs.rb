class Kotlinrs < Formula
  desc "Compiled Kotlin runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/kotlinrs"
  license "MIT"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.1/kotlinrs-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "88a4e5c50049418ac66839df758fa8828379418d2330e07cdb8f570ca82565e7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.1/kotlinrs-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "b409340e4ae95d08169f40c177a85592e342e0065ef1ce4d1daae02bc8820598"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.1/kotlinrs-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5bb9c9a05323190a3d0ed0b87b31d6c60ddaff0dff3679000dbf420ea11dda29"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.1/kotlinrs-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0d0c3d23dee4a912b439214854951f0654dd7d07e9127e66a7db36d6cb83b1af"
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
  #   kotlinrs-v0.1.1-x86_64-unknown-linux-musl.tar.gz  sha256: 9ad659c1cdb308b54892e548c9068221dbf8d4711878f518c6fc60ccab1d4f5d
  #   kotlinrs-v0.1.1-aarch64-unknown-linux-musl.tar.gz  sha256: 3e41f724fe38aaaebe42725380ad609902cea8a05a0d97fd3cd545efd97c76fe
end
