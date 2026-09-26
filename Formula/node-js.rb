class NodeJs < Formula
  desc "Compiled JavaScript runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/node-js"
  license "MIT"
  version "0.1.12"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.12/node-js-v0.1.12-aarch64-apple-darwin.tar.gz"
      sha256 "a2e86311ea4dfbd85785eb92df7dbb3284ba52fa874e8c7ddb03e204a095fded"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.12/node-js-v0.1.12-x86_64-apple-darwin.tar.gz"
      sha256 "d0bb1aa57db02a316ea93df41fa73d59c027d06d555905bf490b129a43a66bf9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.12/node-js-v0.1.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e4677fec76256e4c371122f96acd0ec9f5ebea7dc2d69fb6306518780b6e74e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.12/node-js-v0.1.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "347e9d78caeab9e8aeecd5a0e5dcf5e15ac0e05fab139975c5a8ef0a87cc8b12"
    end
  end

  def install
    bin.install "node"
  end

  test do
    assert_match "42", shell_output("#{bin}/node -e 'console.log(6*7)'")
  end

  # Static musl tarballs also published at this release:
  #   node-js-v0.1.12-x86_64-unknown-linux-musl.tar.gz  sha256: 5b66e46dc8fde612a6b210effa81946d029a9efff537e8d7a3912f329205a360
  #   node-js-v0.1.12-aarch64-unknown-linux-musl.tar.gz  sha256: 34164f8b7adf13bd2916a428770472f9826d9a5a8469a60a8c9b632759755e79
end
