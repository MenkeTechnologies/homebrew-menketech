class Groovyrs < Formula
  desc "Compiled Groovy runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/groovyrs"
  license "MIT"
  version "0.1.12"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.12/groovyrs-v0.1.12-aarch64-apple-darwin.tar.gz"
      sha256 "10392205427e17e0e240d4702e4ee7d2854c65bac0c9d4bc18158cad86b68bf1"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.12/groovyrs-v0.1.12-x86_64-apple-darwin.tar.gz"
      sha256 "bdc15e0cc332e3da102bd7a62117c4ca9a89a31f0d993030ae4e5744efde86dd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.12/groovyrs-v0.1.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3554b3f4d09792743603d1dbf39636cf6155a1bdfb3691b6627ca419cbe94b82"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.12/groovyrs-v0.1.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7d70db63f1c06ed0138eedf2d6fa08077d8947b627b81c4dcd49bf5f8f1169f4"
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
  #   groovyrs-v0.1.12-x86_64-unknown-linux-musl.tar.gz  sha256: 0c85a9fb78deb4f9585187e76bf35dcca80962c1161d1464f9e86717b715b45b
  #   groovyrs-v0.1.12-aarch64-unknown-linux-musl.tar.gz  sha256: 3086cce4fc976bf4651f4dc5914dcd3af719a7d33ac04629b44c1f7071a04af1
end
