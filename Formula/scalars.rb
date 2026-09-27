class Scalars < Formula
  desc "Compiled Scala runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/scalars"
  license "MIT"
  version "0.1.6"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.6/scalars-v0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "a0344fe35c96b206a782ec9bb4f387a2a2f0e24104fb4df304e551f93bee15c8"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.6/scalars-v0.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "d97e82edbdd173040b683d12e18d90155df60c6ac4b837c58377bc13056acfe3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.6/scalars-v0.1.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "529bd5dfb221759f143e86cecd5db42373e630fefa34fba61dee812491ffc766"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.6/scalars-v0.1.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b3499ab83caeb1e22a1da4f82d4fb523103129e7c195a0f672cce2c712696a85"
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
  #   scalars-v0.1.6-x86_64-unknown-linux-musl.tar.gz  sha256: 0deadeb1c7fc347c82872d0e079c50a992987cf0b5ccb8b1d2a9e4b954b74d46
  #   scalars-v0.1.6-aarch64-unknown-linux-musl.tar.gz  sha256: 224206346a661bb569ef7b4c0b1379b30795e0a4ae4053ac5ce4f25cc13bb76d
end
