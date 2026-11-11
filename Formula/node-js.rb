class NodeJs < Formula
  desc "Compiled JavaScript runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/node-js"
  license "MIT"
  version "0.1.15"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.15/node-js-v0.1.15-aarch64-apple-darwin.tar.gz"
      sha256 "c486fd32b8b7fad610acd2d97b84246d7985fd5c6d14d43cd36f8047d90b1de5"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.15/node-js-v0.1.15-x86_64-apple-darwin.tar.gz"
      sha256 "efc48361af3fa3649d1dbb0658bc3489502b13f1ab98221fcfd50bb7905a0283"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.15/node-js-v0.1.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5e0b3a8d4e7961eb47a975c41d7b9aec0ec93c9d958bb268ae85b02180382c24"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.15/node-js-v0.1.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "51d2d43fbdfdbfb4b919cc624d14b1c203db9b07024b3f3180b4ccce723c0d8e"
    end
  end

  def install
    bin.install "node"
  end

  test do
    assert_match "42", shell_output("#{bin}/node -e 'console.log(6*7)'")
  end

  # Static musl tarballs also published at this release:
  #   node-js-v0.1.15-x86_64-unknown-linux-musl.tar.gz  sha256: b4a8864befd1531be17c4b8d51d548d7adafd9da4eb084b9ebe9fb4971634fce
  #   node-js-v0.1.15-aarch64-unknown-linux-musl.tar.gz  sha256: 2dc470263c506b87342f08d394c63ae7f1f1657c18b439ba26e5d1f1bcda9958
end
