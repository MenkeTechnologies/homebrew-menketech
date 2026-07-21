class Javars < Formula
  desc "Compiled Java runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/javars"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.0/javars-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "d24acbbe4d22f2d7872ba184519bcef6f77fbcc15758f2f6fcc57d688d624920"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.0/javars-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "ecc19c03bb404e5ce5045f0fcba4279b931af7e89d46e2b9d134712585ea41fc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.0/javars-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "94c230ef3236d3285fd7b091b3767100f28b5d06bb99745acc269dcd16c04544"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.0/javars-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "281f283ac40e86c6ae5f5d9d18db0fc078daff55f23a3fc03a32f77b0ddb639d"
    end
  end

  def install
    bin.install "java"
  end

  test do
    (testpath/"T.java").write("class T { public static void main(String[] a) { System.out.println(6*7); } }")
    assert_match "42", shell_output("#{bin}/java #{testpath}/T.java")
  end

  # Static musl tarballs also published at this release:
  #   javars-v0.1.0-x86_64-unknown-linux-musl.tar.gz  sha256: cef6727dacfb776821f66aa01e0b7ffb6017d9882e780cf18214796e519e6c75
  #   javars-v0.1.0-aarch64-unknown-linux-musl.tar.gz  sha256: 2a1013d3c05acc1309f1485a674291c524e49c55ed336544db537cc381724207
end
