class Kotlinrs < Formula
  desc "Compiled Kotlin runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/kotlinrs"
  license "MIT"
  version "0.1.11"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.11/kotlinrs-v0.1.11-aarch64-apple-darwin.tar.gz"
      sha256 "65a9f98206e70b16dc579f119126103300f98bfec617c7c20d0c9b4b26fbd868"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.11/kotlinrs-v0.1.11-x86_64-apple-darwin.tar.gz"
      sha256 "3cd76287c6874c75d08b58d6e2e7522bc84a3d82c7f4cb4a4487513f187caaf2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.11/kotlinrs-v0.1.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9e2969ad5d40bb00addcedf1d60f5ed8af637ab0e71c3c5bec56d5ec495d115b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.11/kotlinrs-v0.1.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "693985a87a9c98671fbd95a5f6b1c6155bab7b69b21c971ea6986717b7485454"
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
  #   kotlinrs-v0.1.11-x86_64-unknown-linux-musl.tar.gz  sha256: b44575b23bfe543e3092e0ff033089398ec696c0d534f689e4b8e32f7fc61b66
  #   kotlinrs-v0.1.11-aarch64-unknown-linux-musl.tar.gz  sha256: 6834f1392b1258baf7fc599fd97aaa7bf226cce0d333a3bbb8e3b211db730759
end
