class NodeJs < Formula
  desc "Compiled JavaScript runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/node-js"
  license "MIT"
  version "0.1.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.3/node-js-v0.1.3-aarch64-apple-darwin.tar.gz"
      sha256 "3dfd05aa0c6f1f140e8aa22cb6ab947e3da9328437f3502ae8a4fb44f3bd6cd3"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.3/node-js-v0.1.3-x86_64-apple-darwin.tar.gz"
      sha256 "4392c6592f77a8cb647fe98a430233cbcdbfad5d5f9850b33eea38c73743166d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.3/node-js-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ffec0244f92c4e064255f0306c1d2d24d555c2ef67047dfc36328cf9ec451a4f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.3/node-js-v0.1.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c64e79acc93205424c4c9a70f71df0ba1c2488d70ae790e4363751e6ecd62b9a"
    end
  end

  def install
    bin.install "node"
  end

  test do
    assert_match "42", shell_output("#{bin}/node -e 'console.log(6*7)'")
  end

  # Static musl tarballs also published at this release:
  #   node-js-v0.1.3-x86_64-unknown-linux-musl.tar.gz  sha256: 23dfe327903a30fae54e004af311097de4c35f88f57d9ae02b12b57468bccddc
  #   node-js-v0.1.3-aarch64-unknown-linux-musl.tar.gz  sha256: a097da714756abc26c32784b98ba5354bcd774022233366301da2a1db3a5b3a4
end
