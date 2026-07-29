class Javars < Formula
  desc "Compiled Java runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/javars"
  license "MIT"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.1/javars-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "1ca82e02a36545075e61434079303043b39dc9441e0f2d7751ab45f7d43da374"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.1/javars-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "0b26a50482f8c03bae7d88976d669cf5e0b0bed3f389c7cbfbbc7ebcffffd489"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.1/javars-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "357f8fb6d667b30c25cc834b1354ffa78e9537be4d69eec2c32ca81003eb3f0e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.1/javars-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b7cfbcb926c2a202848942d874bf66548a199c7249a919b592879cc59bf4a39b"
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
  #   javars-v0.1.1-x86_64-unknown-linux-musl.tar.gz  sha256: 1ad7619379ee5fcb6f9aff1e7ab03731bb78ea54cb5fc1a5ef039e35aa283ee8
  #   javars-v0.1.1-aarch64-unknown-linux-musl.tar.gz  sha256: efd257977dc03d6f9d6ca6b0a9a05c4b0e2591760a0583747af3982f2d30653f
end
