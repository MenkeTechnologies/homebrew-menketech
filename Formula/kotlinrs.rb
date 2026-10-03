class Kotlinrs < Formula
  desc "Compiled Kotlin runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/kotlinrs"
  license "MIT"
  version "0.1.10"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.10/kotlinrs-v0.1.10-aarch64-apple-darwin.tar.gz"
      sha256 "f4e8f6137252b8e2688e0f2ceef31e19ad2fbbe5d9adca790b697ea52344d4b1"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.10/kotlinrs-v0.1.10-x86_64-apple-darwin.tar.gz"
      sha256 "733494b1e4024482dda47621adb7acb2e73bee8d927d060e8e151730c6845766"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.10/kotlinrs-v0.1.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7166200c105ec6ae8d0f497f2e1725e2aee017aeae232d79caeeafe69a0e9313"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/kotlinrs/releases/download/v0.1.10/kotlinrs-v0.1.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "53a05e79a1e9220c0b19ca233b696fa00b5c993c181f34e8fd46d80b4b7bcdda"
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
  #   kotlinrs-v0.1.10-x86_64-unknown-linux-musl.tar.gz  sha256: d2cdd6ffd9a8623788febf3eda322adb64e246980db9ab1b667d558dd8b41bef
  #   kotlinrs-v0.1.10-aarch64-unknown-linux-musl.tar.gz  sha256: 85567f1c371fa2b9b96da238735b6ef1cdf16f3055920f79643972a9d04c3e0a
end
