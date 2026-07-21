class NodeJs < Formula
  desc "Compiled JavaScript runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/node-js"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.0/node-js-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "8c8dcbfbe053de579241cc197fa76c40c7de5e84ce85f13d1128b6712fc745e6"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.0/node-js-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "114263f83e4f7d4301a192be5c56017496f2b6bd3206b8867b030b8c5dc6a895"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.0/node-js-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cd4e8c0d4b8ee76e9d38dbd0f50511a1d6d7fc9e9e2f35c2517f434074e036c2"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.0/node-js-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c85c9299acfe51b00555242ad68378099b4995cdb81e00ffde0667da91312e72"
    end
  end

  def install
    bin.install "node"
  end

  test do
    assert_match "42", shell_output("#{bin}/node -e 'console.log(6*7)'")
  end

  # Static musl tarballs also published at this release:
  #   node-js-v0.1.0-x86_64-unknown-linux-musl.tar.gz  sha256: a4e64dd008f409b159f7fd0b7bc079d055ab019a49e561b89abee91244e0e448
  #   node-js-v0.1.0-aarch64-unknown-linux-musl.tar.gz  sha256: 3280c3b7191148a0c73a8c18fa386a0fde9324a9b9bc16db7523ef35ccbd75b0
end
