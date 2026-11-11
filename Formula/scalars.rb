class Scalars < Formula
  desc "Compiled Scala runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/scalars"
  license "MIT"
  version "0.1.9"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.9/scalars-v0.1.9-aarch64-apple-darwin.tar.gz"
      sha256 "b7bde9567e47d33f0919e618521d7f1364fe1188d38d04404b25ddf99cb2adb5"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.9/scalars-v0.1.9-x86_64-apple-darwin.tar.gz"
      sha256 "084a085b5c68c2f01b66bdfb51df67d02811d36193dd0481b426d2c3794f2811"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.9/scalars-v0.1.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9839143553020a24e6bf2eead7bf87538f685b5479461f30cdfea06d14fda7a7"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.9/scalars-v0.1.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "66e55c00e3bd971278fa5e578c1c2e0b15cc75a788563920fa85d718aa7e9b2e"
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
  #   scalars-v0.1.9-x86_64-unknown-linux-musl.tar.gz  sha256: 0b4f0b933cf2b87e0915c68ea7747c6ac7ca0335cc911516b40284ea2c6659e7
  #   scalars-v0.1.9-aarch64-unknown-linux-musl.tar.gz  sha256: 92a5ddd1666c40e7fe130d3fe9a45a6a5820cbb57be561de7a1808db45f3c419
end
