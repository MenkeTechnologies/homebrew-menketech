class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.14"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.14/zshrs-all-v0.12.14-aarch64-apple-darwin.tar.gz"
      sha256 "d223fedb2b9c8d43505bc32fe0c5265e77f2bcccc2460108a31a87ff4ade6ed4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.14/zshrs-all-v0.12.14-x86_64-apple-darwin.tar.gz"
      sha256 "f41cf9dfc7ef1e466477e293c5d4931b9a3b26a0822764cbbd64ece4b65879cf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.14/zshrs-all-v0.12.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2712840f4c2e00fc547f181cde5098ec9b718324c88d6d96b3c058f58c526941"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.14/zshrs-all-v0.12.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ac187b54384d8399341cfe0f91004f985e406d12fa926c2182e06871dc9dc12c"
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
end
