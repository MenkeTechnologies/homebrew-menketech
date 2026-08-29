class Javars < Formula
  desc "Compiled Java runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/javars"
  license "MIT"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.4/javars-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "5b8955ab666901c4050f9c06a42fee20df25f88a0472f4ad50ca807dfe35e3bb"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.4/javars-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "43cfeed8b76a1d486a83dae913e75cc4aa6e31203298857b56d7696caac7f3bd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.4/javars-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b975ef436927125ee8005bd2139a609b107a2eed61b2fbc6e5c7b8b09e37eab6"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.4/javars-v0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e529176725054e11113596ae22b74023324fbdd28f4c19caf3c8a9b04fff5852"
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
  #   javars-v0.1.4-x86_64-unknown-linux-musl.tar.gz  sha256: 959322603eac8bc398603fb74c45239424cc390faae1013d7a229d62ebaa275a
  #   javars-v0.1.4-aarch64-unknown-linux-musl.tar.gz  sha256: b4d1c42b9aa93fce945428d93e2df9c61db6493ec7fac840488ed49edba7dfab
end
