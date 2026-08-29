class Scalars < Formula
  desc "Compiled Scala runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/scalars"
  license "MIT"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.4/scalars-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "e82760ca67a915c22dd9d1b921ed4607ca19ecb21e4eae813899a03fad42f9f5"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.4/scalars-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "dcf6bea887ddc90a7ade822c8e0b77984954458a7e68b5cda073d6440f576f1c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.4/scalars-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3a3f332aec210381654a2424be49245d1e6468d33e37030b0a5e0921fe00a803"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.4/scalars-v0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "88bcc56b8814fadbeea83269e46219d8144d24ee2886bd49bfeb58534d40ebc6"
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
  #   scalars-v0.1.4-x86_64-unknown-linux-musl.tar.gz  sha256: 991fd4cffe4d4468a4c423c469d0f3b74e0209d76a842b82ed570c012210f6f9
  #   scalars-v0.1.4-aarch64-unknown-linux-musl.tar.gz  sha256: 1f6a4870da5411c7647afdbb21f65a7d94c6512c132aeec60c11be4eb68a433f
end
