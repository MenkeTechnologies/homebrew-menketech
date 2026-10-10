class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.36"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.36/zshrs-native-all-v0.1.36-aarch64-apple-darwin.tar.gz"
      sha256 "79afe6df54293e3911b612bae624de6e954f89b982bea55f96bcc3e021b8ba2b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.36/zshrs-native-all-v0.1.36-x86_64-apple-darwin.tar.gz"
      sha256 "70e55838cf6bea4380ad24c23674fac1d1c004dfa3209fb080226b2da4f9e3d0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.36/zshrs-native-all-v0.1.36-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e2ed1c6f5b09fc967e8461ad549f39c0616c37fed395ce7c74fb07ba6f22195a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.36/zshrs-native-all-v0.1.36-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "067d28054b8982bf51e172d507023d6cec9b0b8e9f65fec3dc2131c0deb5ad1c"
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
