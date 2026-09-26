class Scalars < Formula
  desc "Compiled Scala runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/scalars"
  license "MIT"
  version "0.1.5"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.5/scalars-v0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "f0798ec9299fd7651118cc3245218ddb5a47841063255aeb3001556af805b5c7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.5/scalars-v0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "b19b946e882c01adf332611527ee5dcbab5ebff6abff54efc848388022eb7312"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.5/scalars-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e336255cd77137d382257360c50f9f29ebada3492fb4e7f443ddd885f04686f5"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.5/scalars-v0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1119c5e8fda61cad675325ef87d721ba9b2cd3925eb116738d42d40d9885b1d2"
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
  #   scalars-v0.1.5-x86_64-unknown-linux-musl.tar.gz  sha256: 43df003fdd494dc3bc7b154e59cf9ddef14f83229344140c179ba74f5701efc0
  #   scalars-v0.1.5-aarch64-unknown-linux-musl.tar.gz  sha256: 73257876e68b318984bf6fdefd825880f6fdbdf594e40124ee7add6476dd071b
end
