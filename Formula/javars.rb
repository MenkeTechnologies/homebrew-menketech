class Javars < Formula
  desc "Compiled Java runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/javars"
  license "MIT"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.3/javars-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "ea893c5f18fd410a9a08c993187f12350fe3f81e7349a46fda82423cc5496ab6"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.3/javars-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "e233ce39c8856c65bc65a50690ecd62f7b4fd6e9c8f9a1b1cad2a20b49ae924c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.3/javars-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6faf5dbf0ae1dfccb451e9ba1ac7adfcb55af50d7ab0b30811e4e8131ff117ad"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.3/javars-v0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d29edf00ba74b72c3a8f497153dc5ae806d76ea3bd8fc4b302276dead901943f"
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
  #   javars-v0.1.3-x86_64-unknown-linux-musl.tar.gz  sha256: 83380329512bae55b0a61c83137a5dba7ef476bc8f2d69dc2ae12c17a7576ad6
  #   javars-v0.1.3-aarch64-unknown-linux-musl.tar.gz  sha256: dd62b307ca6aa96a300de2ca35127d1746751af8836652a0bf65811c304170fc
end
