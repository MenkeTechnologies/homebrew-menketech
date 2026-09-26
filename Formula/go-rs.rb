class GoRs < Formula
  desc "Compiled Go runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/go-rs"
  license "MIT"
  version "0.1.11"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.11/go-rs-v0.1.11-aarch64-apple-darwin.tar.gz"
      sha256 "118ee2ed385822e9457e5c3a96f8f220a6b70d2f39049e8ddbe0d72ebb7116ec"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.11/go-rs-v0.1.11-x86_64-apple-darwin.tar.gz"
      sha256 "f281295ccfb06564cdbd295bac8c43a2970ccc86641029ebeaf4658bbcb4a58a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.11/go-rs-v0.1.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5dedad16dabca5c1e7d1d1dacc8f71b3ed130067c2abd4a2ae9814ed7736e759"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/go-rs/releases/download/v0.1.11/go-rs-v0.1.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1b24ed99b72790f45e6aee22f7a47265c00da1fbc3c3b382ad58769bc05d6e67"
    end
  end

  def install
    bin.install "go"
  end

  test do
    assert_match "go-rs", shell_output("#{bin}/go version")
  end

  # Static musl tarballs also published at this release:
  #   go-rs-v0.1.11-x86_64-unknown-linux-musl.tar.gz  sha256: 131ed205a8063071976e325004cfe0e228c137c242e8d2a962b7a333f97142cd
  #   go-rs-v0.1.11-aarch64-unknown-linux-musl.tar.gz  sha256: f0bcad1a7f56d96f4a3fd759b6a06cec665bb7a8b33764222f12e03fe78ca7b4
end
