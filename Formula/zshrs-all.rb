class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.76"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.76/zshrs-all-v0.13.76-aarch64-apple-darwin.tar.gz"
      sha256 "b85d98e4d9ece0b29f7b4fb1a76956d142e135117272d26399d4bed686764c1f"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.76/zshrs-all-v0.13.76-x86_64-apple-darwin.tar.gz"
      sha256 "61c8e0d9e476583da5d3dfe29ecaed8c3ebdee2c254be893af347d2ae8114dbc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.76/zshrs-all-v0.13.76-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "92f8d74b40498ccd89f6c9906bf2cf84c8867b6107238de6bbbdba8a15fa6f55"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.76/zshrs-all-v0.13.76-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fb46fb451b9504ccdd6f3a895cf232de204201dca55be93a7674d582182c10c3"
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
  #   zshrs-all-v0.13.76-x86_64-unknown-linux-musl.tar.gz  sha256: d43363e6c3e1f6fc99ecc4e201590ff958d78f56109f04c57e2d43b9d4ccab66
end
