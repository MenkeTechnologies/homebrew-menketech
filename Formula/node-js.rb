class NodeJs < Formula
  desc "Compiled JavaScript runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/node-js"
  license "MIT"
  version "0.1.14"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.14/node-js-v0.1.14-aarch64-apple-darwin.tar.gz"
      sha256 "f087d1d92598aaeed33d89bb64911829bb26392b9390a58d8d2b33de5d7d63d4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.14/node-js-v0.1.14-x86_64-apple-darwin.tar.gz"
      sha256 "2dd88368e97f4821591dc907e1c3277504700e95f4ea05a1e6734a8b8ad9964c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.14/node-js-v0.1.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7988331f3f416683b00ae67c71518749318b870d7756b33d2a6e69789e61bdf2"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.14/node-js-v0.1.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "71cc53d3ed0b18774ac4cf7567ae8152641fc7fc1c017716ddee997247ba7aa1"
    end
  end

  def install
    bin.install "node"
  end

  test do
    assert_match "42", shell_output("#{bin}/node -e 'console.log(6*7)'")
  end

  # Static musl tarballs also published at this release:
  #   node-js-v0.1.14-x86_64-unknown-linux-musl.tar.gz  sha256: b304f4bbc1c551a8286610196aef3a2a21c4fcfa2a3acb7dbec3e12945f87d5e
  #   node-js-v0.1.14-aarch64-unknown-linux-musl.tar.gz  sha256: acfcf79f77831d9c5c0f1d36813aa9ab1e04a7a9b590ef46ff5fb270148367f7
end
