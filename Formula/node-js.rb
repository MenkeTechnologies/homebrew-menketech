class NodeJs < Formula
  desc "Compiled JavaScript runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/node-js"
  license "MIT"
  version "0.1.13"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.13/node-js-v0.1.13-aarch64-apple-darwin.tar.gz"
      sha256 "0f639af2378c3d7d29f73c4f1245ea874294a4e0704cfc45175a9b218dc132e4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.13/node-js-v0.1.13-x86_64-apple-darwin.tar.gz"
      sha256 "0aaa7ee9360d739e4aee4a86d078e086cac1d92316edbbb10a39f7f52de16409"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.13/node-js-v0.1.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "19721d96dcb2edbd1c4d14879977e08747ddf4a7b2cde6b2a5a3cd2e66365059"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/node-js/releases/download/v0.1.13/node-js-v0.1.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "688aa95c1d943b2eea5daad0c17a632586e9ad1309d4fe6e8d61713e9aba1495"
    end
  end

  def install
    bin.install "node"
  end

  test do
    assert_match "42", shell_output("#{bin}/node -e 'console.log(6*7)'")
  end

  # Static musl tarballs also published at this release:
  #   node-js-v0.1.13-x86_64-unknown-linux-musl.tar.gz  sha256: 28d01dd4e67513868651d63c6313b7cb6b773f3b51bb5306acb529d13c6b5e42
  #   node-js-v0.1.13-aarch64-unknown-linux-musl.tar.gz  sha256: 9d0c2bcfaaafc9abc74a15f1105a4f9f3b67d78f8b8a493ef92a50e8e4a479db
end
