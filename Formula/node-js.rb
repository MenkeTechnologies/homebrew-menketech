class NodeJs < Formula
  desc "Compiled JavaScript runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/node-js"
  license "MIT"
  version "0.1.16"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.16/node-js-v0.1.16-aarch64-apple-darwin.tar.gz"
      sha256 "cbee7dc94d99a7005d7a71a61d0acfe9c7b9cf7a1079964a9d7fb38acc1fca23"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.16/node-js-v0.1.16-x86_64-apple-darwin.tar.gz"
      sha256 "4244d94678c92edddc17213d75d51bd9bbb6d8a5c4d90f76311a7df7a828bcab"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.16/node-js-v0.1.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4cfafb13a23c04d9043cf801a19c7d3a9a594f83a9c6cd8ddf416c8e93b60669"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.16/node-js-v0.1.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "63df69f6f992cfff8b197f851f84435c9fbf04219969a8a35bb43e4406feedd5"
    end
  end

  def install
    bin.install "node"
  end

  test do
    assert_match "42", shell_output("#{bin}/node -e 'console.log(6*7)'")
  end

  # Static musl tarballs also published at this release:
  #   node-js-v0.1.16-x86_64-unknown-linux-musl.tar.gz  sha256: be58001439aa160636813a00012a38fa73e32db991c9c70f9d5cbbc546b26b46
  #   node-js-v0.1.16-aarch64-unknown-linux-musl.tar.gz  sha256: 5afd0f90329693c9a377ca61974a8edac6e6ed0cb5ef4a8a9ba1ff774c501251
end
