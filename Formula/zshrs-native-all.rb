class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.9"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.9/zshrs-native-all-v0.1.9-aarch64-apple-darwin.tar.gz"
      sha256 "d5d74a37979f97c293532d31713ee470b91af6bb86f7211e116218634d96b259"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.9/zshrs-native-all-v0.1.9-x86_64-apple-darwin.tar.gz"
      sha256 "cef09db4f935b07f39dd84044acadff6aa01e4b95e3dbd19d45cfea4339add0f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.9/zshrs-native-all-v0.1.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e2a824db09ab284e58f490c38222e054fef9883d4ea1e65b5e127b36afa819c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.9/zshrs-native-all-v0.1.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0344c3b37c1febe5fe05b8fe103d27309b6c75ecd91721a328af0baa24283478"
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
    assert_predicate bin/"zd", :exist?
    assert_predicate bin/"zshrs-recorder", :exist?
    assert_predicate bin/"zshrs-daemon", :exist?
  end
end
