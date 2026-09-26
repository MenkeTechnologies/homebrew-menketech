class Kotlinrs < Formula
  desc "Compiled Kotlin runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/kotlinrs"
  license "MIT"
  version "0.1.7"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.7/kotlinrs-v0.1.7-aarch64-apple-darwin.tar.gz"
      sha256 "d5bac41c7340e9410b2f40a532372643eba49c0e7b1b200eba5205b7636b5f01"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.7/kotlinrs-v0.1.7-x86_64-apple-darwin.tar.gz"
      sha256 "d88bab2b9bc5c6469f7d09fd3420f77bfaeae4e162ed481596c4a36e180ee6a3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.7/kotlinrs-v0.1.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2e9d5a6f584c4520561ce9a41503c26b46f6a5874a48330be7ec6a07ff9b59d7"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.7/kotlinrs-v0.1.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "79d4d55c892400b4aa726fd03f124d022f948c13c05fb03bcff319cc39217e61"
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
  #   kotlinrs-v0.1.7-x86_64-unknown-linux-musl.tar.gz  sha256: dfcc7b00c87c2ea864be0ae66013ab3bb2dfbd2b48bfee4a491159d8248e7462
  #   kotlinrs-v0.1.7-aarch64-unknown-linux-musl.tar.gz  sha256: 63509082bf36fd85c070abc29775f99d54f8b7d918625b06e1c26b9484c729a0
end
