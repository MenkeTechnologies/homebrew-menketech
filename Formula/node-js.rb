class NodeJs < Formula
  desc "Compiled JavaScript runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/node-js"
  license "MIT"
  version "0.1.4"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.4/node-js-v0.1.4-aarch64-apple-darwin.tar.gz"
      sha256 "dd72bb4de10b9675aa0551e4f26f760f4b570563b23684900372ed291c455f52"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.4/node-js-v0.1.4-x86_64-apple-darwin.tar.gz"
      sha256 "1f08627f30a78c3700e83bc305a28bdf41bcb2e7d7469b056a4512fb1b651dbe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.4/node-js-v0.1.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "40d0657eb9704797c3c26652da0a49cea7d8cf489bb6bd60c1b5479405192c2a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.4/node-js-v0.1.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b228e51341ac7aaf604074a0c1dd0810471e4ee464e35dba1197b1de3fe2b97b"
    end
  end

  def install
    bin.install "node"
  end

  test do
    assert_match "42", shell_output("#{bin}/node -e 'console.log(6*7)'")
  end

  # Static musl tarballs also published at this release:
  #   node-js-v0.1.4-x86_64-unknown-linux-musl.tar.gz  sha256: 7a2dd39befc2e14683528d86c22eb8f606f950abd26c02e81a24953b609adfd9
  #   node-js-v0.1.4-aarch64-unknown-linux-musl.tar.gz  sha256: 346fe48caf2d4156645f40fe8e0129acaf689446feeb8fd9952fa8f3e7eebc83
end
