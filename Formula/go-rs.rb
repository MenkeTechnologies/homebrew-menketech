class GoRs < Formula
  desc "Compiled Go runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/go-rs"
  license "MIT"
  version "0.1.14"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.14/go-rs-v0.1.14-aarch64-apple-darwin.tar.gz"
      sha256 "59bdebc0c9758442eaae1ac89d6c382b2f926c06675f8b7ac6c6dfba96d52d3e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.14/go-rs-v0.1.14-x86_64-apple-darwin.tar.gz"
      sha256 "558c98012c8d620f491084b465b6d2c277a42e6a89997305ad2ad062aabaff26"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.14/go-rs-v0.1.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "da333e093f55f28c4f20456969623eff603750a0d06be10a076778d29a58868a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.14/go-rs-v0.1.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "220b4ff497667b9720f5f42753283c6273dbdc40a8c81b4f4830b2d01c55bf6a"
    end
  end

  def install
    bin.install "go"
  end

  test do
    assert_match "go-rs", shell_output("#{bin}/go version")
  end

  # Static musl tarballs also published at this release:
  #   go-rs-v0.1.14-x86_64-unknown-linux-musl.tar.gz  sha256: 4b801842c6a81d1586caa36e0d00231eeac36bdce51b0e4bab4faccbca024634
  #   go-rs-v0.1.14-aarch64-unknown-linux-musl.tar.gz  sha256: 9b7c30ba8f4ced4b4c11efe3b8bfe92692dc960b3d5e1be8701345d7a7492092
end
