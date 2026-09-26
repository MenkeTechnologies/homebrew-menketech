class Groovyrs < Formula
  desc "Compiled Groovy runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/groovyrs"
  license "MIT"
  version "0.1.10"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.10/groovyrs-v0.1.10-aarch64-apple-darwin.tar.gz"
      sha256 "de3f4755ceebe29af9f88d34d1d8e8ac151fc48bb7c11b3f0d2777536714caf3"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.10/groovyrs-v0.1.10-x86_64-apple-darwin.tar.gz"
      sha256 "b979c639a55ef6d8546f11391a75279f1b98a0a3ef33b1639a6b0bc57b889cdc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.10/groovyrs-v0.1.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "627933307a35c2618c711af828df63ce0e364a02d791f5f92bb033fb62af3362"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.10/groovyrs-v0.1.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0fb682ecc79d45f5b4b7384a0b437ae6ba81edc755fa61eeeb91a9e70e0aa09b"
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
  #   groovyrs-v0.1.10-x86_64-unknown-linux-musl.tar.gz  sha256: 6aa90f77a38ecaa8dfcfb843a70736f41d714c73890a468bff37f0a9c75ca3a6
  #   groovyrs-v0.1.10-aarch64-unknown-linux-musl.tar.gz  sha256: 7d83bcbcc9378d7ecb9845a2ad9544cf6dc2e768500efddd1c183da7859239e7
end
