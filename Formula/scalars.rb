class Scalars < Formula
  desc "Compiled Scala runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/scalars"
  license "MIT"
  version "0.1.8"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.8/scalars-v0.1.8-aarch64-apple-darwin.tar.gz"
      sha256 "d418b89147ba81d18409b51653e4aa36f71800fda66e09ba7f34889ac791470a"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.8/scalars-v0.1.8-x86_64-apple-darwin.tar.gz"
      sha256 "36b85e0a9429c6260ad3ca4705a16e57dd9528818343b0f68766e25ba74d5799"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.8/scalars-v0.1.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "db7dfde51cfd72e3149e8d7db135d13d6f6e18f4befc5c5eb393a996fe076269"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.8/scalars-v0.1.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f613c97b02410d7e788c95aafd4867e945a7c8c71091eb96db4094414992393d"
    end
  end

  def install
    bin.install "scala"
  end

  test do
    (testpath/"T.scala").write("object T { def main(args: Array[String]): Unit = println(6*7) }")
    assert_match "42", shell_output("#{bin}/scala #{testpath}/T.scala")
  end

  # Static musl tarballs also published at this release:
  #   scalars-v0.1.8-x86_64-unknown-linux-musl.tar.gz  sha256: b2b531fa0c5986298dcd98b9f9277b242193e0a11e1b7d1768cbd87019d4637f
  #   scalars-v0.1.8-aarch64-unknown-linux-musl.tar.gz  sha256: 6d7d49cd2f68e5719e7be98c890b131614ebb32e3c3aa9fc78a2cb342bbecd4a
end
