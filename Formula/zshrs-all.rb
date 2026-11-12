class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.63"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.63/zshrs-all-v0.13.63-aarch64-apple-darwin.tar.gz"
      sha256 "eb2e3a89062511b404a6825eb87a11351f633b4c27b1d8f6a91f240464abf03e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.63/zshrs-all-v0.13.63-x86_64-apple-darwin.tar.gz"
      sha256 "18964120e70051a0f56796169c6740a4f95e0d7482277d1076cc77d635d8552a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.63/zshrs-all-v0.13.63-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b8326a52cc764c2f34e93bc5b5b4e52514a4bcc3a73a418b92fb12d19b4ff250"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.63/zshrs-all-v0.13.63-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8fc06e6b906e3b57cfe94afd8fb37ac978389627cd5dc551961a30111eadff1c"
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
  #   zshrs-all-v0.13.63-x86_64-unknown-linux-musl.tar.gz  sha256: f76eac6a03bf7264b0a795d1179ac0b7f14899fb5a1cdd7876ee153fccc0ee2d
end
