class Kotlinrs < Formula
  desc "Compiled Kotlin runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/kotlinrs"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.0/kotlinrs-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "7e4d84791fa380e7a9faefb0f72ae000ecf13e0650863f7f0be0c3c5e778d1cc"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.0/kotlinrs-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "93653c797c10c2683faa3ecd8f00d8316205b0539d427324a70ea8e1310c82c5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.0/kotlinrs-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4b76cb8e7f4238e239f00bfbf248f66cc9d2bd88816e14daf0987f9c68d8c874"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.0/kotlinrs-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b2b5d768acfc819e63c2645b9c4ecd7de203f4fb77d600d75202c0b69ec74ffc"
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
  #   kotlinrs-v0.1.0-x86_64-unknown-linux-musl.tar.gz  sha256: 39af60eac366740446811559905f2223aeee80884ecd6527ba02fb20060594ec
  #   kotlinrs-v0.1.0-aarch64-unknown-linux-musl.tar.gz  sha256: 26f61404a3a025a88d7556cd98614688a1ae976c69eb51ecff66a12fd6c3628f
end
