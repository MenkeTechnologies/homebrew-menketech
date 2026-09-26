class NodeJs < Formula
  desc "Compiled JavaScript runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/node-js"
  license "MIT"
  version "0.1.11"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.11/node-js-v0.1.11-aarch64-apple-darwin.tar.gz"
      sha256 "a94f2166f4edc91789d39a409c034fc24a137cfa323f87940a80b9f9e15e5b30"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.11/node-js-v0.1.11-x86_64-apple-darwin.tar.gz"
      sha256 "c6bb4ccfd7ee5c43454b7dbfa87519d3737c752f91c14998f1286fc2bd725c37"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.11/node-js-v0.1.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c6225d3006f256f990be834a50cbcb6b477271c74c6d120debbd71fa55f2e13c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.11/node-js-v0.1.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ff19546196049f9ccdaa380c48cc59fee3930ec7b328980176cf64751cf392ab"
    end
  end

  def install
    bin.install "node"
  end

  test do
    assert_match "42", shell_output("#{bin}/node -e 'console.log(6*7)'")
  end

  # Static musl tarballs also published at this release:
  #   node-js-v0.1.11-x86_64-unknown-linux-musl.tar.gz  sha256: 1941c0516aa5d5ec57bfe315cef29091e48af55a2597b6a1e121063f6b11ce0e
  #   node-js-v0.1.11-aarch64-unknown-linux-musl.tar.gz  sha256: b7547e3e0d4dbc6c910aefe8bd9c39e95bb61f6018fc9cef5f8b64a1e8538661
end
