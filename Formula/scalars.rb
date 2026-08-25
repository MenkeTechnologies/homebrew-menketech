class Scalars < Formula
  desc "Compiled Scala runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/scalars"
  license "MIT"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.2/scalars-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "ca03d784bcbf65fa2e866e05eb9a9083bf76f68075709bb43513955779be23fc"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.2/scalars-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "3c8c7c067bca18b3f9b5fc1f5319dae68642fcc0fd52d0f67f383b6c1aa09406"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.2/scalars-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5d0df30533cc8d721e6a0e315f149e13657e963cb48fad97a865381a38796bc5"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.2/scalars-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "28f8d82a9159998aaaf87c3a9d3959ccc0809c3cfeba8ea5a0fc62c7082b11ac"
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
  #   scalars-v0.1.2-x86_64-unknown-linux-musl.tar.gz  sha256: 6fed8d43367b9f7b48f5c7f7e66727ee4ffb8b8c4b79ef4eae1b4bd387b6d324
  #   scalars-v0.1.2-aarch64-unknown-linux-musl.tar.gz  sha256: 3104bbf8a50e9769d434034b3de85e7125481107b701a9926c14d518829beabe
end
