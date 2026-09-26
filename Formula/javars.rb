class Javars < Formula
  desc "Compiled Java runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/javars"
  license "MIT"
  version "0.1.10"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.10/javars-v0.1.10-aarch64-apple-darwin.tar.gz"
      sha256 "bf1c68d3a22af8caa52255a40b7017009ab392d651cb38cdc5dd99001708dde8"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.10/javars-v0.1.10-x86_64-apple-darwin.tar.gz"
      sha256 "a20ca658db41c18beb69a955275a739b8c9778575e05ff1c56944ecef3133e28"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.10/javars-v0.1.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d2eca097d8623c489be02020338ee5c0d44754100629283688b50b21eade0c6a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.10/javars-v0.1.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0878d5c2c485ee0d10897acb55d7614eba9ed8c492e2a96ba14b80447b80fa98"
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
  #   javars-v0.1.10-x86_64-unknown-linux-musl.tar.gz  sha256: f49406cb2308561deaa0459c245a22a1303faa21b669de425318520210a5a9de
  #   javars-v0.1.10-aarch64-unknown-linux-musl.tar.gz  sha256: 52b9a7c33499b15253aee26c3f86f033a90125bf5d9931d1825d2faa9055634e
end
