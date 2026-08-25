class GoRs < Formula
  desc "Go on the fusevm bytecode VM — compiles to fusevm::Chunk, three-tier Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/go-rs"
  license "MIT"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.3/go-rs-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "dc1c6c354dbebb865ee02afcb64395ceeb40e3a493129441e767a778f16b044b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.3/go-rs-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "5b941770e2a88496f0d84e36fb5bfa1a2e4fd11e278ae9477fd28c776150e717"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.3/go-rs-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8f8270f3084f89e0a5928f5c880099c2bde17f8f201a631f11ed0678a6efc7e7"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.3/go-rs-v0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d3f1c2cd98d199f4801c8ca4af4862242fb355fbd735bb7eb85b4a048a0da360"
    end
  end

  def install
    bin.install "go"
  end

  test do
    assert_match "go-rs", shell_output("#{bin}/go version")
  end

  # Static musl tarballs also published at this release:
  #   go-rs-v0.1.3-x86_64-unknown-linux-musl.tar.gz  sha256: ad984f686eef8bcb4115840441766768c23c1f46123acd75815f326d702c4515
  #   go-rs-v0.1.3-aarch64-unknown-linux-musl.tar.gz  sha256: b13db311b671049f03a3a04c907755cdf7d62f7b6ba83e957fdbf5245400fcc2
end
