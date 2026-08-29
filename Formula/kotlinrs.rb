class Kotlinrs < Formula
  desc "Compiled Kotlin runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/kotlinrs"
  license "MIT"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.3/kotlinrs-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "cb8b0f171745e81f26bf210e8f0a531e198f308e936d667ce34b6cbbbbb12b4a"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.3/kotlinrs-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "d91deaf2594b8e25e0872c862406b4dcca3284a6c7b2cdcf4195ba71576e1b55"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.3/kotlinrs-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "56977230d8d289ff28745aebe2c9581dfd3bb7924f055e4e30862ab36549bf50"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.3/kotlinrs-v0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0a4893f2ed8a0b653c1ca8a9f2759dd02e60f297cad51e7dce50b524ae2892ae"
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
  #   kotlinrs-v0.1.3-x86_64-unknown-linux-musl.tar.gz  sha256: 1bf1da380ba9d498955a7c2e001f682574470da336610f26e4006066089b2acd
  #   kotlinrs-v0.1.3-aarch64-unknown-linux-musl.tar.gz  sha256: b81e9992b9ea163a909b4603fdbb39a3f964e6dbd9a86ca781934c8e98b1f812
end
