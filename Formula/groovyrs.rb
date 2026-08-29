class Groovyrs < Formula
  desc "Compiled Groovy runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/groovyrs"
  license "MIT"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.4/groovyrs-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "98a591f605ace4025df563e6f0248bf954abe80f2f5e177c229aa02d5a208617"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.4/groovyrs-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "f21b0fb85e01122cca7e235fd6bedaadeaaee3a4bc218e21749e8c3cb416a4ee"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.4/groovyrs-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5f2822b2c5e84a34fe03678d6b1250b15e8dbed9c7dbe8292f27f1708ff67e4e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/groovyrs/releases/download/v0.1.4/groovyrs-v0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4f55db81a2c88e7fcc5cf3a528fb1b13389298dde292330dc45aae58740c9097"
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
  #   groovyrs-v0.1.4-x86_64-unknown-linux-musl.tar.gz  sha256: 23ffbd55c7c7b1b0559e5bdac89ad3226980544133370a8571332cf820e8bbe3
  #   groovyrs-v0.1.4-aarch64-unknown-linux-musl.tar.gz  sha256: 3353c650acb97422d67897366c4de6227f201a3947165b692658de670cb26761
end
