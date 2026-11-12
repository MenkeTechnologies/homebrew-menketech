class Groovyrs < Formula
  desc "Compiled Groovy runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/groovyrs"
  license "MIT"
  version "0.1.15"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.15/groovyrs-v0.1.15-aarch64-apple-darwin.tar.gz"
      sha256 "8934fe1699d2010f621e4ddf1edad39e8c91922ef4f67f6db75406046ea4ab14"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.15/groovyrs-v0.1.15-x86_64-apple-darwin.tar.gz"
      sha256 "e5c05efddb51052f2c6aec8ca323ab9049b038aaf606506fbd3675734e643202"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.15/groovyrs-v0.1.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9f53bc14b8ff2576b540593523ace783f0966dcf40c5999556a44919ddef9c5e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.15/groovyrs-v0.1.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ccaecca050a63e6d6cc5c7256931ae04d5c882aef76e143e4df151a8d1b31332"
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
  #   groovyrs-v0.1.15-x86_64-unknown-linux-musl.tar.gz  sha256: 933f9aa590ba72541aacb107727642a0af0e11bff42708a21e842716b7f358b3
  #   groovyrs-v0.1.15-aarch64-unknown-linux-musl.tar.gz  sha256: 85dfee68daccc3401260bf73e896e4cc4f4ceaa3b288bdfd31fe92e14749911c
end
