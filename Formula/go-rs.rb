class GoRs < Formula
  desc "Compiled Go runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/go-rs"
  license "MIT"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.4/go-rs-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "e0c396addbd700824def42616835f92f315a30a4760e4634570ad255bae3ba14"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.4/go-rs-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "4c1231d4a85457201f78cea939b71f73b90691e7261b9b073d8c0fd0f2b27da3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.4/go-rs-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f3d0116a5695a00e1be64f64478b63571bfee89535c189db36f89a7cf1f43228"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.4/go-rs-v0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ec2bc273e4dd694442613ecea0c726e2b20bfa249cb6336883d6eed93fadd2f9"
    end
  end

  def install
    bin.install "go"
  end

  test do
    assert_match "go-rs", shell_output("#{bin}/go version")
  end

  # Static musl tarballs also published at this release:
  #   go-rs-v0.1.4-x86_64-unknown-linux-musl.tar.gz  sha256: 031126c4928c7a19290e5ea829db450a2db8b13cde5a168d0a19e734ca871f33
  #   go-rs-v0.1.4-aarch64-unknown-linux-musl.tar.gz  sha256: 8a3199e0fd25e90a03a90988e2dd32f920bbf9a703b496b1776875455c8955bf
end
