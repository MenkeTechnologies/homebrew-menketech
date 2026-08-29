class Scalars < Formula
  desc "Compiled Scala runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/scalars"
  license "MIT"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.3/scalars-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "4bb493c9a5a0868a1fe41d74ebaa20a7c1b22717d5a63e7596be5ddadc6c1a39"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.3/scalars-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "5a7ee8a2e53671895f8b42a0d8b77bccda5c6bec9f47bbdc74e4acd03cd9e9f3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.3/scalars-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a806ba5fd0434bc60ff1fd4c5b8273af50b534070c41fd2e36fdf06b4040b3d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.3/scalars-v0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a44a445d143f33482a041628eb423d7d5ada96757751740f64fc374a0cd22616"
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
  #   scalars-v0.1.3-x86_64-unknown-linux-musl.tar.gz  sha256: 6ab107c3e025817e7a8e2b956ad52433a60b9e9ab909eb6e210f3dcf3e520952
  #   scalars-v0.1.3-aarch64-unknown-linux-musl.tar.gz  sha256: 55d597e8c8933a5c27e713dd2a2a58b3a30d54e6846ad17472071814a0451c52
end
