class Groovyrs < Formula
  desc "Compiled Groovy runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/groovyrs"
  license "MIT"
  version "0.1.11"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.11/groovyrs-v0.1.11-aarch64-apple-darwin.tar.gz"
      sha256 "4c93644b30a062c584647227be433779248628da3b16047db954fe1c395738f9"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.11/groovyrs-v0.1.11-x86_64-apple-darwin.tar.gz"
      sha256 "47e8f0e6d641394e1ba9201f9e700bf17cd34d572747803cfc69ee163f7f10b9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.11/groovyrs-v0.1.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "29b42bb15a68a8b200f6a87d5509a66259014457dcf14e3eb4e87bde2628b887"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.11/groovyrs-v0.1.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "67d38ab6b3853bf5022d66419949981ba9ffc0dd71cb7e288d04043c029e5832"
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
  #   groovyrs-v0.1.11-x86_64-unknown-linux-musl.tar.gz  sha256: de3ab49392e987e44c3fdf8cab3c2715922d44df76190449108b93c4d44ffb1d
  #   groovyrs-v0.1.11-aarch64-unknown-linux-musl.tar.gz  sha256: f07b4255c062723b1df82670ab8bd7a7e9f398de707e0b76f05a80936e1e4f21
end
