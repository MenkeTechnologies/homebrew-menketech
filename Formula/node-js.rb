class NodeJs < Formula
  desc "Compiled JavaScript runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/node-js"
  license "MIT"
  version "0.1.5"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.5/node-js-v0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "21f95f77d88615ec21e5182c645d88a1ad14cc169b08a4e8ed9a7c9ec5dda9fa"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.5/node-js-v0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "30b63c696b51ed3f82bcaf467e1187ba9803d2e531a59e7de41cfc7a87e1922a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.5/node-js-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d086f57ea6aba090fbb6d63563e8c5046ffea3a520da2cf69f5c243c0917927d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.5/node-js-v0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d7ce18c666772f8ea9e9eef11b8c11e8031029caf8d5e58cb73524032f39caeb"
    end
  end

  def install
    bin.install "node"
  end

  test do
    assert_match "42", shell_output("#{bin}/node -e 'console.log(6*7)'")
  end

  # Static musl tarballs also published at this release:
  #   node-js-v0.1.5-x86_64-unknown-linux-musl.tar.gz  sha256: 508c0604dba6c298c2c108b68e17ff8df9ec3a1aa8b187dae414d7fffd9f2450
  #   node-js-v0.1.5-aarch64-unknown-linux-musl.tar.gz  sha256: a2b311219316ee7b5bcc9577aa423fa5bd0a9a74d2ab38df6aaf2ed2dde63682
end
