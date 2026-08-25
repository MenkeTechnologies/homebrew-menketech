class NodeJs < Formula
  desc "Compiled JavaScript runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/node-js"
  license "MIT"
  version "0.1.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.2/node-js-v0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "4f937743d813053d4f7c346e16d38160f007f4092ce570b93b08da09df2144c6"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.2/node-js-v0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "b3c2311f4fceed45722e9fbf55d1501ebad2129a1054764cfdc2ae1e06e3083a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.2/node-js-v0.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "22440b0ec761891672fffa7bc88f12d204cf2f92eb507229861c57d4710604f7"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.2/node-js-v0.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ca83dcac737fe4f7fc0bba24d326feb43c6d8c6bb12de10f9897bd2092f136f2"
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
