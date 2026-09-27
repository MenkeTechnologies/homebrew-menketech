class Kotlinrs < Formula
  desc "Compiled Kotlin runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/kotlinrs"
  license "MIT"
  version "0.1.8"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.8/kotlinrs-v0.1.8-aarch64-apple-darwin.tar.gz"
      sha256 "70ee3373cd3ee9e15eac3f9dbdede0bc8b9029d594c690c63cbae0f3e8a0c9cf"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.8/kotlinrs-v0.1.8-x86_64-apple-darwin.tar.gz"
      sha256 "ca229b468f15f4fbe039cfa06218c937e06513a9dfe5bb2aeaab1317942105c8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.8/kotlinrs-v0.1.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "787791c27203d03b87953d703b704247b33e867b5e08025a1e7e34719f96d508"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.8/kotlinrs-v0.1.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "60bf69379d9ee4f5358cfd3fc93bf62f9c63d9aafe0ecfd1099c5f013195e8c3"
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
  #   kotlinrs-v0.1.8-x86_64-unknown-linux-musl.tar.gz  sha256: 71663b87a4e33c493878f56a842af72b1093d8fe466116d34b6cf7d62e22293c
  #   kotlinrs-v0.1.8-aarch64-unknown-linux-musl.tar.gz  sha256: 9ce02262eda4de8d4048bb30866ae9cd8fbfd07031e78a70d151e941d5c915e4
end
