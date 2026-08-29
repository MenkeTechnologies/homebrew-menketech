class GoRs < Formula
  desc "Compiled Go runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/go-rs"
  license "MIT"
  version "0.1.5"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.5/go-rs-v0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "ab767f045c7dc59bcf0298c29621b8b01b0d1458a7a7e67dc157d85b1f6b68a6"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.5/go-rs-v0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "77f966a7088647e6b9aa7335438bebec4a921754f786cb96123bd40736f8e397"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.5/go-rs-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c5e8a7d132c8f8a26a293953c41c8b31553bb9b03e1900cf823968f2f584bdfe"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.5/go-rs-v0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9bfdc77b9b3340a94a8037a1203e75632b7b952cc0f4a54318f05d76b7b93d15"
    end
  end

  def install
    bin.install "go"
  end

  test do
    assert_match "go-rs", shell_output("#{bin}/go version")
  end

  # Static musl tarballs also published at this release:
  #   go-rs-v0.1.5-x86_64-unknown-linux-musl.tar.gz  sha256: 213d5a9441737cd9b0c982469580d77517772278f1b1dd752274e242658e1952
  #   go-rs-v0.1.5-aarch64-unknown-linux-musl.tar.gz  sha256: a76c2b0466b7f69c4688c22fa3a78d2c2b0c50b5e5cc01410e71409b614cc9fd
end
