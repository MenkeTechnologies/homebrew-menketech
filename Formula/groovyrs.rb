class Groovyrs < Formula
  desc "Compiled Groovy runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/groovyrs"
  license "MIT"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.1/groovyrs-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "4e2a0db04f13c7e82cc09bd11272ff30fc66a0ad9ce2971fc3334795e3e59400"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.1/groovyrs-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "a56578d6a7998f45f167ca3f1c4e0526ffde9dfaa9bb26e29fac389c59256943"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.1/groovyrs-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "932586ed480df744d06f747d87cf295d4d0c40aa25375f0e701da15cb370614a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.1/groovyrs-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "99914f14bca4ab720829936b6c8155cb2c73808201b07e1ae84344c8154cdabe"
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
  #   groovyrs-v0.1.1-x86_64-unknown-linux-musl.tar.gz  sha256: cca82bd9a92d0a508e04b72a2b240fd96440fd7ff1b92e8937acbe3f47b36461
  #   groovyrs-v0.1.1-aarch64-unknown-linux-musl.tar.gz  sha256: d1e4367c1aebe9bbc10996cc90e474fa81654808b7126a5f8bb5c0d0e80099f4
end
