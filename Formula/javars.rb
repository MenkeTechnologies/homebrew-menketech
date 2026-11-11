class Javars < Formula
  desc "Compiled Java runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/javars"
  license "MIT"
  version "0.1.14"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.14/javars-v0.1.14-aarch64-apple-darwin.tar.gz"
      sha256 "27eb6c535ddeda99a0f8e4da068f3be5778abf0218f586b8231feed51cac0cc3"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.14/javars-v0.1.14-x86_64-apple-darwin.tar.gz"
      sha256 "3b131dbe9e71a16f3d2a74f1d37914ebecfb360a36e5d4c068e141a11e86bdd5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.14/javars-v0.1.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ce8c1f8c343a051fa29074ab8666d703e3cea5300b5b7731331b1c5c35f88585"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.14/javars-v0.1.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "63a50e80c462db7a368831c8880deba934f4e01c0e3c3bb1ba958b7b8f04505a"
    end
  end

  def install
    bin.install "java"
  end

  test do
    (testpath/"T.java").write("class T { public static void main(String[] a) { System.out.println(6*7); } }")
    assert_match "42", shell_output("#{bin}/java #{testpath}/T.java")
  end

  # Static musl tarballs also published at this release:
  #   javars-v0.1.14-x86_64-unknown-linux-musl.tar.gz  sha256: 4fc353b699403b503578bd9d6a3874b4fd83eccf2a0df5dfd5243343ff94ede6
  #   javars-v0.1.14-aarch64-unknown-linux-musl.tar.gz  sha256: 67c93bca4545057e10b1741c5d6567a7f0e83c8d01f1732e28c23c89f95a8af9
end
