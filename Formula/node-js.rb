class NodeJs < Formula
  desc "Compiled JavaScript runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/node-js"
  license "MIT"
  version "0.1.6"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.6/node-js-v0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "7b4a27aaac76b4d9057fbf33bf312a7f18e1b406ccd7fa0cbaa671f657c50d7f"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.6/node-js-v0.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "0949db08a6747c2f31c963b17cca6a061220fdb89abeb5afaefd3ae2e9beaa0a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.6/node-js-v0.1.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f0b604d8fbdbc5c485bda95b58707e5bae97997e390f05995c56aa9ce6a0c022"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.6/node-js-v0.1.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1c996c799cdf9854513b708f8780dcd2df7969699928581e487368ec639e43c6"
    end
  end

  def install
    bin.install "node"
  end

  test do
    assert_match "42", shell_output("#{bin}/node -e 'console.log(6*7)'")
  end

  # Static musl tarballs also published at this release:
  #   node-js-v0.1.6-x86_64-unknown-linux-musl.tar.gz  sha256: 5ab10ca14fc5ce981f2913f87f049f7db9a8d19d971f5824990083dea033da02
  #   node-js-v0.1.6-aarch64-unknown-linux-musl.tar.gz  sha256: ca083e6473be3de5be331c20a21e850df3d2e6830749d4549c483ad7d2cb470b
end
