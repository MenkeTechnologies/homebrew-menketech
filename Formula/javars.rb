class Javars < Formula
  desc "Compiled Java runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/javars"
  license "MIT"
  version "0.1.12"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.12/javars-v0.1.12-aarch64-apple-darwin.tar.gz"
      sha256 "2487235390398ab6bc392c005c0746a65cea582a2d85d85313310abc55d0bb43"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.12/javars-v0.1.12-x86_64-apple-darwin.tar.gz"
      sha256 "da81b340605561040100961de7494c503122617fe0a5e349c7edced7794ab047"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.12/javars-v0.1.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "497a5dd79a58337c1a9ffd9234335582480f00ba9b670ae33747f901254b8b40"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.12/javars-v0.1.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "115362b48f8ddad5728943d364170fd916a57707201f973a8bb1beb19ced0750"
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
  #   javars-v0.1.12-x86_64-unknown-linux-musl.tar.gz  sha256: b20303a3faa322ad70d6268aa6cad53bff4281c93f408a3e96324ae0b601b41b
  #   javars-v0.1.12-aarch64-unknown-linux-musl.tar.gz  sha256: 65df04f20a45a6ad74ec2f93b55f3c2e96fc6606a96917d0736ca8525a51520a
end
