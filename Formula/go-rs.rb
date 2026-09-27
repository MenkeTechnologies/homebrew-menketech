class GoRs < Formula
  desc "Compiled Go runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/go-rs"
  license "MIT"
  version "0.1.13"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.13/go-rs-v0.1.13-aarch64-apple-darwin.tar.gz"
      sha256 "02f2d744ff5b05853a9068ff16a28a7e0c22e00f8f6992b2df4c8eacca46b063"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.13/go-rs-v0.1.13-x86_64-apple-darwin.tar.gz"
      sha256 "4abd08868e9a3d9f893a5d06036495ba5b96a9a2e74df04e853bd9412da529f9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.13/go-rs-v0.1.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ed44914e69ae43f0b7c7481941592f0ec09f3d22d7e56f15439efd6b8d17e9f5"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.13/go-rs-v0.1.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "73ffeeb5006001fc388589229b5b643533c5e0ee99323464fab60b3f34ccf852"
    end
  end

  def install
    bin.install "go"
  end

  test do
    assert_match "go-rs", shell_output("#{bin}/go version")
  end

  # Static musl tarballs also published at this release:
  #   go-rs-v0.1.13-x86_64-unknown-linux-musl.tar.gz  sha256: b651d65a6f587f5554884bbf1fbca79c087661cfd12c7c1f10745a2acfe8bf26
  #   go-rs-v0.1.13-aarch64-unknown-linux-musl.tar.gz  sha256: 8eabf7cd9416714536b08b0d9a6a4882d3d931b2b759f502be3f887ac231a923
end
