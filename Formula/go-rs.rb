class GoRs < Formula
  desc "Compiled Go runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/go-rs"
  license "MIT"
  version "0.1.15"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.15/go-rs-v0.1.15-aarch64-apple-darwin.tar.gz"
      sha256 "c7db56a87059850d90f77f5705e40a7e1a9145c27535c94ea58dfd1da4125fc9"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.15/go-rs-v0.1.15-x86_64-apple-darwin.tar.gz"
      sha256 "74a9af5bd8ba491eb6b7fb034a582a7f53fee9a47b9b2f9e718697ae7577e5dc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.15/go-rs-v0.1.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "822df1fd2527fb37d329b260cef0214a75237e83e446863dc7980357b2946e6a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.15/go-rs-v0.1.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d2e622eac6334f40c0b0ea2cbd65afa91a139aafdf12e1ed9c260fe4b5de5daa"
    end
  end

  def install
    bin.install "go"
  end

  test do
    assert_match "go-rs", shell_output("#{bin}/go version")
  end

  # Static musl tarballs also published at this release:
  #   go-rs-v0.1.15-x86_64-unknown-linux-musl.tar.gz  sha256: b5ad0f5c35056bce64cfe46433637b00a3500ed66c24adff4bc8e032429323ba
  #   go-rs-v0.1.15-aarch64-unknown-linux-musl.tar.gz  sha256: 4b275e5ccdae63297809e5d95fc9d009067be92bdf2d47fcedfd69cbc1a9042b
end
