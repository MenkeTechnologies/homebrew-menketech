class Scalars < Formula
  desc "Compiled Scala runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/scalars"
  license "MIT"
  version "0.1.7"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.7/scalars-v0.1.7-aarch64-apple-darwin.tar.gz"
      sha256 "ec7c18a9eb1e9a50b9f6937c151a8b2a90583655d438cdd04c7b336ee19caace"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.7/scalars-v0.1.7-x86_64-apple-darwin.tar.gz"
      sha256 "24201768695c19bd0e670c26043b8390aa9e41354ea60c6f605959b4f1fef773"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.7/scalars-v0.1.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0c03d1eb1663588acf5d2b1fe805e165ef06a8da1d30267057fd91ca13113548"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/scalars/releases/download/v0.1.7/scalars-v0.1.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0b18dfc50c82a13a921f6d5f11191aa502f3005b62bb88d5c92ba95a089cdb73"
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
  #   scalars-v0.1.7-x86_64-unknown-linux-musl.tar.gz  sha256: fd4b2de265e3485607f7b12fbecae1da1ae01274bc7044d44a259115cb26a97b
  #   scalars-v0.1.7-aarch64-unknown-linux-musl.tar.gz  sha256: 5163739a12b415990d9b93cacab03f8d3cb5822b31938a5db88c40ca44b89d4a
end
