class Groovyrs < Formula
  desc "Compiled Groovy runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/groovyrs"
  license "MIT"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.2/groovyrs-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "2f40e1dcb25f697d710b0a132e166ca990cb78ac1f945301ff6cd415962d48de"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.2/groovyrs-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "157242e8703c1bed0802a70043f62c6e8956c407de5220b8206c18c60b92e8b1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.2/groovyrs-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "815cf25a1cba0709cef810a9f9303ce293c0cd4af1b452abfedfeeb40122183f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.2/groovyrs-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "02bb112b65c50d6384eb19150bafcd4f5337b27821738b2a3f56cfd81742c2ce"
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
  #   groovyrs-v0.1.2-x86_64-unknown-linux-musl.tar.gz  sha256: 94a0779a9bf83e478938a64459908a335021a4dd465bd7a5678e4d8ea9956169
  #   groovyrs-v0.1.2-aarch64-unknown-linux-musl.tar.gz  sha256: 3e60316792f6c29ee4de9cdc5106918e455be2f0df17469f8a1a0ef2aad33db1
end
