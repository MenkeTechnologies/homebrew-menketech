class Groovyrs < Formula
  desc "Compiled Groovy runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/groovyrs"
  license "MIT"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.3/groovyrs-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "f19141b63318dc346c3f24409683881545a29cd229d68aacfc693b44d8773ac6"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.3/groovyrs-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "4b63b519863f6a8da718cfcdbb90a8dcfbb73edefbf3a5b361db0247d19abd25"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.3/groovyrs-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3011796574809366ecfe00ff1f985118db6063ad974b61d8913399dce69133c1"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.3/groovyrs-v0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c2b3f564bea55a6bbf2d9c0c17675b7ffc264e83a245fff1746072b751a470be"
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
  #   groovyrs-v0.1.3-x86_64-unknown-linux-musl.tar.gz  sha256: 38c85913e1e5b48efbd7ba0d155b2b5a5a425d75f9d41d956dd26e53a8698c5e
  #   groovyrs-v0.1.3-aarch64-unknown-linux-musl.tar.gz  sha256: a77829a1ba422440dd1ba2998e4d9ac7dfd8aaf6c6db5f3796d8fc408b5cbf7d
end
