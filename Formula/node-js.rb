class NodeJs < Formula
  desc "Compiled JavaScript runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/node-js"
  license "MIT"
  version "0.1.10"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.10/node-js-v0.1.10-aarch64-apple-darwin.tar.gz"
      sha256 "1ec5759be482646c1eb2177173387940298a8219e45be6154b19227ba25f4e35"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.10/node-js-v0.1.10-x86_64-apple-darwin.tar.gz"
      sha256 "b8d4f01adae9edf37b878b36d85c34f38d582dc650d57f41fc38f8877a8831ec"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.10/node-js-v0.1.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e8ac5e3abb1cc6e1c17b76fa07b7321e462cd527640488630d7da4fa55c6ee5"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.10/node-js-v0.1.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "03dc80189b62b95d359335d85aab735c6fafe7a59eb45277fed6231b256d2988"
    end
  end

  def install
    bin.install "node"
  end

  test do
    assert_match "42", shell_output("#{bin}/node -e 'console.log(6*7)'")
  end

  # Static musl tarballs also published at this release:
  #   node-js-v0.1.10-x86_64-unknown-linux-musl.tar.gz  sha256: d3612103f314081b7060cd7b862bc6602ac6fe536e8044c459341185caa73393
  #   node-js-v0.1.10-aarch64-unknown-linux-musl.tar.gz  sha256: 941f7a20ce7e0d366129ccc91af6bbe39b87d2056d657eb891f53529ca414ce2
end
