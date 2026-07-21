class Scalars < Formula
  desc "Compiled Scala runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/scalars"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.0/scalars-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "fac1b35e5c7490a9a2193932a64005d0c83f8bc04a6a9b9ba5ed3428e9843cef"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.0/scalars-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "1163eb8df072f5c070224bb9ac05e2b6a48390f76f69ace881ca4efa2d9c6f11"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.0/scalars-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b8a6a4cc6899b554a19553d5e62b46ff45a3b7f43ec64afbeedf4a041cba405c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.0/scalars-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "26360ee1d1539dafc3eb66484598f2c6df3ee1c3dfe04977e925d1ac3ab7048f"
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
  #   scalars-v0.1.0-x86_64-unknown-linux-musl.tar.gz  sha256: c8ecdb25579b348af8c22968a48063c8707746989248481f9e297ab4957c481d
  #   scalars-v0.1.0-aarch64-unknown-linux-musl.tar.gz  sha256: 23ec93b184517e6e8a74dd7482613d2e2e25d6334ea8d9020aa38633c8967621
end
