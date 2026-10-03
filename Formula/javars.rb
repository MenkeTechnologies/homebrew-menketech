class Javars < Formula
  desc "Compiled Java runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/javars"
  license "MIT"
  version "0.1.13"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.13/javars-v0.1.13-aarch64-apple-darwin.tar.gz"
      sha256 "4858486e2f5fe9ce653ee60c8a271e664eed9b79c14f449a10cf58329952aa71"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.13/javars-v0.1.13-x86_64-apple-darwin.tar.gz"
      sha256 "e0b520d59970c86550cee7635ba7cbff9928f4fad7fcda398d406be8996e496b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.13/javars-v0.1.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4a15b6ffc8817a2aa7a763a6c1aaee6c7cd45b068a96473a53b047a5e58732d5"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.13/javars-v0.1.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "94c78fcead1ad25a422e519427ba04d88dabd5bdaf83c01a7148ab7e7a8a4b43"
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
  #   javars-v0.1.13-x86_64-unknown-linux-musl.tar.gz  sha256: 28a0addf0de8bc51edb1dc598d1bea6b2900f69f9888cd8e410a9235fae37dd4
  #   javars-v0.1.13-aarch64-unknown-linux-musl.tar.gz  sha256: 7cf9ed80cad98bb658e5fe2a4041c25d010f0871179d42dc1a9df1ff324890b9
end
