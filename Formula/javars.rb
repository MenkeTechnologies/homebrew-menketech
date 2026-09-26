class Javars < Formula
  desc "Compiled Java runtime on the fusevm bytecode VM + Cranelift JIT (no JVM)"
  homepage "https://github.com/MenkeTechnologies/javars"
  license "MIT"
  version "0.1.11"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.11/javars-v0.1.11-aarch64-apple-darwin.tar.gz"
      sha256 "b74a45a94ecd3476c3392e35c2b67bdcfb094bdbe46ddbcd196ffde82b8ce1bb"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.11/javars-v0.1.11-x86_64-apple-darwin.tar.gz"
      sha256 "108ba6021b0b20c0bd7b72431cb38257e90d22b9857f81a0e691cc8b934a8d9d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.11/javars-v0.1.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "35ab27094b2eac16c5dfef788244e431965471e85f993f7b92a52153aeeb49ad"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/javars/releases/download/v0.1.11/javars-v0.1.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9c1f463d71cd777abd57f412ab8bfc6e36e917147eb19cfe6b62a61e952d0de5"
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
  #   javars-v0.1.11-x86_64-unknown-linux-musl.tar.gz  sha256: 09efd6ce4a89401f05caacade6afb21d92931f422dfcbe4290c0d17f726582f7
  #   javars-v0.1.11-aarch64-unknown-linux-musl.tar.gz  sha256: 78e836a555edc5129ea4c06e5e7a13160f920f199d17d54ad60ff67276bba908
end
