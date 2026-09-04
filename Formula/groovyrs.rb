class Groovyrs < Formula
  desc "Compiled Groovy runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/groovyrs"
  license "MIT"
  version "0.1.9"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.9/groovyrs-v0.1.9-aarch64-apple-darwin.tar.gz"
      sha256 "938a37ef76613752c2fd87c88f91fcfbd36d9e678b25ba4b995fa41f29e758aa"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.9/groovyrs-v0.1.9-x86_64-apple-darwin.tar.gz"
      sha256 "fec958693e14950e4ee9244886f3fd64529d44bde6ee9479c3fb76c9e0554b03"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.9/groovyrs-v0.1.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c98ef86e6ed701d8519be5a7f69405c09469c0c772d63a66fccdbe17735818f4"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.9/groovyrs-v0.1.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d9391920c480f38e73dc515a4e76b6d22becf2f21a85b8250f5d10abca3aab83"
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
  #   groovyrs-v0.1.9-x86_64-unknown-linux-musl.tar.gz  sha256: ee22558384e29b7e09518a60bc8822865c312f26f6e5a1cdb9339aff01a05ced
  #   groovyrs-v0.1.9-aarch64-unknown-linux-musl.tar.gz  sha256: d8ec057b41c944de63f76fcb7e2947bba5d19869c45379156d8e70c456bfcc54
end
