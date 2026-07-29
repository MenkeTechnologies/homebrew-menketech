class Scalars < Formula
  desc "Compiled Scala runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/scalars"
  license "MIT"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.1/scalars-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "129ac5ebee4fdf075f23f86225d6e380bbcc02dca767ab342e27fcd0ffaff5d2"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.1/scalars-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "ad41a6735ed09394d841b2bf64df15a87cdf40199129f6e78c9a8abf5b181339"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.1/scalars-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cb5dbd646a73f9442464ebf0271880aac6445e4ac60dec9c35dcf3637f6d3fce"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.1/scalars-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c9006190c2eb3ff6a7d5a5e72db073aa30be97a83fd59db3b35a6c720f8e6d79"
    end
  end

  def install
    bin.install "scala"
  end

  test do
    (testpath/"T.scala").write("object T { def main(args: Array[String]): Unit = println(6*7) }")
    assert_match "42", shell_output("#{bin}/scala #{testpath}/T.scala")
  end

  # Static musl tarballs also published at this release:
  #   scalars-v0.1.1-x86_64-unknown-linux-musl.tar.gz  sha256: 89eee710e091430be416d84b1adc2b4fdd8b017d13662c4eca74eb8b11469164
  #   scalars-v0.1.1-aarch64-unknown-linux-musl.tar.gz  sha256: ad6f80b902c3986a03aa539f7d8ffec7d45c53aa70640cde929a0f2e38313057
end
