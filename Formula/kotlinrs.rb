class Kotlinrs < Formula
  desc "Compiled Kotlin runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/kotlinrs"
  license "MIT"
  version "0.1.9"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.9/kotlinrs-v0.1.9-aarch64-apple-darwin.tar.gz"
      sha256 "816d5974dbb817e6943e97b6c3c86aef5b3dafa4aee2c77aa72c2a62bc81c92b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.9/kotlinrs-v0.1.9-x86_64-apple-darwin.tar.gz"
      sha256 "47135a405e5660d1b86ee11c15ed112ee22b9a52b63277ec22e0ee0f9478d31e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.9/kotlinrs-v0.1.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0ffabc062f684090ce504b4772ddebfaf031eaac08aa07ef49cb3a647b129abd"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.9/kotlinrs-v0.1.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "83b43ca470f09baa4e8cc8a739f6024b1838b9d72f5aad4f25b462aa8a901632"
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
  #   kotlinrs-v0.1.9-x86_64-unknown-linux-musl.tar.gz  sha256: 9cfc01ee4e02a878b3b143630951f0b6d68e623f63c0a1e2eec419e4e628217b
  #   kotlinrs-v0.1.9-aarch64-unknown-linux-musl.tar.gz  sha256: 2da3c162523f1e176ef3df5e9b5c7c0b1364c6f7d4213dbd726ab688569d9b42
end
