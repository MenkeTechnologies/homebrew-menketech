class Javars < Formula
  desc "Compiled Java runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/javars"
  license "MIT"
  version "0.1.9"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.9/javars-v0.1.9-aarch64-apple-darwin.tar.gz"
      sha256 "7377c0c23357c4355a18ea8b26a992cc2cacae6d8b42b3a78321657a3c0ebdf2"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.9/javars-v0.1.9-x86_64-apple-darwin.tar.gz"
      sha256 "69bd255ab8cb95c1ada39a0c5b8425ee0029657061f5e1bb6af9f418fc65112e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.9/javars-v0.1.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8065511894b9d200138b99e4f9248de272fe313476c0b355702caa03c21dee6c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.9/javars-v0.1.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "74b28f89b2a44b638f27cd5539d98ae98247ad6fdec5ad1f2d47fe9fce4b19e2"
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
  #   javars-v0.1.9-x86_64-unknown-linux-musl.tar.gz  sha256: 6e4220bf953e52ed6c272c59bcbb1022c13374a17cac683b11ca13fd5e58dde9
  #   javars-v0.1.9-aarch64-unknown-linux-musl.tar.gz  sha256: ec01e96b20bda34235c96a0e44bc3f58edb78cc34a48e7a8301622ee0cf3ef3d
end
