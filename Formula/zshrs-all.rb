class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.63"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.63/zshrs-all-v0.12.63-aarch64-apple-darwin.tar.gz"
      sha256 "1a4b64e75512878a5aa76494113eaba6af77a0cc275f4653c8ea679affa6aabb"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.63/zshrs-all-v0.12.63-x86_64-apple-darwin.tar.gz"
      sha256 "28ecc5af1838710edaa975c42e3aaf88149d084031c496c24fec213b80b16179"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.63/zshrs-all-v0.12.63-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5e6b233b89a054e99321b0a10941be95072c61a44cce4d57aa202cc9108e73ad"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.63/zshrs-all-v0.12.63-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5a8bf138cd289d96bcb5310fa19c8b3a1aab767fbb6da37ba2a5e542d116e7fa"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
    bin.install "zshrs-recorder"
    bin.install "zshrs-daemon"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
    assert_predicate bin/"zshrs-recorder", :exist?
    assert_predicate bin/"zshrs-daemon", :exist?
  end

  # Static musl tarballs also published at this release:
  #   zshrs-all-v0.12.63-x86_64-unknown-linux-musl.tar.gz  sha256: e0aff007ea9aa6e6acd1695961c7f7d1d4da1c640540b6701e07ef0a52e9c7c9
  #   zshrs-all-v0.12.63-aarch64-unknown-linux-musl.tar.gz  sha256: deb78d99b78e8538ca4b5c3b6be6d4346c6cd1de0b5bce9badd317d344428a2e
end
