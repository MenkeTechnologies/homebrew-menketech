class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.28"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.28/zshrs-native-all-v0.1.28-aarch64-apple-darwin.tar.gz"
      sha256 "6e6cc57efa46b07fd23977e1c1ba62fffeea3bf2ae21cf2eaa0b0f9346b8ebf7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.28/zshrs-native-all-v0.1.28-x86_64-apple-darwin.tar.gz"
      sha256 "81b534e4562477f5911b206c2cfe3fd37a2f0e8d366a824ccd731e9d11a60a0b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.28/zshrs-native-all-v0.1.28-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aedd5e033fb08136f9c6ba44cb51e03c99e12fa2a3a90ca4615af8ac7e11ac91"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.28/zshrs-native-all-v0.1.28-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c5a9fc8679446af56bb186d9910eedb029e18a3a7717ff40e6ed3350856a2b3d"
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
