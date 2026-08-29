class Kotlinrs < Formula
  desc "Compiled Kotlin runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/kotlinrs"
  license "MIT"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.4/kotlinrs-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "7ad6837b472b43d15980d5ed9a50435d18fe1bb0e3e697047b8f1534bf840a1b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.4/kotlinrs-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "d75ee0cf68c4a77c8eb6cc0f228de8abddc9713de79693b3cea97b734bf4ea0f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.4/kotlinrs-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d6db95a3ddb9dd928ddfd85b584dcfae84f86a4301c9d717293a469e3ce97f2b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.4/kotlinrs-v0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aa084a25eb097cc92cb482ae582f383de0e4239f8c35ccdb82c20974913fc8f5"
    end
  end

  def install
    bin.install "kotlin"
  end

  test do
    (testpath/"t.kt").write("fun main() { println(6*7) }")
    assert_match "42", shell_output("#{bin}/kotlin #{testpath}/t.kt")
  end

  # Static musl tarballs also published at this release:
  #   kotlinrs-v0.1.4-x86_64-unknown-linux-musl.tar.gz  sha256: 5e0a3eecbe6e2d6a224e14bf965b10ee9067ed2e7b2cf79daceedafd76b63a04
  #   kotlinrs-v0.1.4-aarch64-unknown-linux-musl.tar.gz  sha256: 35511e36b950392fc62f1089dce3ea26e87c96ac8f6767ec80e128f85279ad5d
end
