class Groovyrs < Formula
  desc "Compiled Groovy runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/groovyrs"
  license "MIT"
  version "0.1.13"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.13/groovyrs-v0.1.13-aarch64-apple-darwin.tar.gz"
      sha256 "56517201c8860abb759f4e2491d32b694ca39ae4f3514cf9f886ee3c691507ea"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.13/groovyrs-v0.1.13-x86_64-apple-darwin.tar.gz"
      sha256 "bc8ea955a1271d6d84ef1391a5411258d3294c96d85e5612572b7f56a3b29ec5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.13/groovyrs-v0.1.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ef39aa0d866814f6af729d74708be3c80dd93079e9134d1efd386708cb695196"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.13/groovyrs-v0.1.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "456dc18e5a6b9e6e361f390d10dde7b181ab0f46a5997af1816aaec4d23e9c84"
    end
  end

  def install
    bin.install "groovy"
  end

  test do
    (testpath/"t.groovy").write("println(6*7)")
    assert_match "42", shell_output("#{bin}/groovy #{testpath}/t.groovy")
  end

  # Static musl tarballs also published at this release:
  #   groovyrs-v0.1.13-x86_64-unknown-linux-musl.tar.gz  sha256: 37895c8f61d8595009fce2c1c4cd5a14356f3b8fd2556ada907971e629e6c455
  #   groovyrs-v0.1.13-aarch64-unknown-linux-musl.tar.gz  sha256: 5e3b286fc6bd2e048b382384641249c7d022f4b8f8cbf3cd8acd0e5fbd8b87aa
end
