class Groovyrs < Formula
  desc "Compiled Groovy runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/groovyrs"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.0/groovyrs-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "fc66898fb73409bd0a6a486526f4ee0a797810f664cc71911ce71fca014bf053"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.0/groovyrs-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "9efaa779fd98e88a4843e643e8f16f61a6f75114a6ce91196453baa8cf09647f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.0/groovyrs-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b1d63c9b3bc96347d6fadd305b84cf0a9c7e1a1a1b72732f69499313f9c40eb9"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.0/groovyrs-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ac4f6b0326514d04ec6171bda39815137d6c2aa2962d6d5be45857a0793397bc"
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
  #   groovyrs-v0.1.0-x86_64-unknown-linux-musl.tar.gz  sha256: eb8508c07f4d99eac38d1ea487311412922e37b5149d0acde901b603dd7a8b1a
  #   groovyrs-v0.1.0-aarch64-unknown-linux-musl.tar.gz  sha256: fb3b5b00d8c4d05b110bfc521c1c464a53ca5acb38d92182c02d7186e47cdc1f
end
