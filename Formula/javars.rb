class Javars < Formula
  desc "Compiled Java runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/javars"
  license "MIT"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.2/javars-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "5f541a8ff3ae3f470633a6ee9400fe1ec38c9ca7260dddc719e0997817dae430"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.2/javars-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "8fd5c68a4aa36a8165930d5c5dbe239188428f5ce2461fb0ba954e07ebe8d1f1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.2/javars-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "400158e1eabbab6760b104462107189aa81c074595f0398c333d6942b2e7b3b8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.2/javars-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2d9278eac4ab98cf7ffaf3d3515b0cba2ac1e0200f8b3932c9b978f0ed730cee"
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
  #   javars-v0.1.2-x86_64-unknown-linux-musl.tar.gz  sha256: 7e6af6530ace1db13613fe3ab5552ce63db51ea506ff76ad34d159687b2dded4
  #   javars-v0.1.2-aarch64-unknown-linux-musl.tar.gz  sha256: 13f5f8d2e96e1b3d2e25532d67381c8a6a7c35c68456bf3d0f23cf4d5384f547
end
