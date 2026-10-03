class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.16"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.16/zshrs-native-all-v0.1.16-aarch64-apple-darwin.tar.gz"
      sha256 "b4dee09d077073ee50aeff96cb6d1ef5cb7c40d3da3561b6c5f3d1b600783de0"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.16/zshrs-native-all-v0.1.16-x86_64-apple-darwin.tar.gz"
      sha256 "9365608884dc45b1ad6ce2295f805d7cc1c6fb1dac1492168d841805065f3c71"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.16/zshrs-native-all-v0.1.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a119190469ee1131f3213e313956fb26665be221e87d076364781ecb7874dfef"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.16/zshrs-native-all-v0.1.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a86c33623c8ff463f14acd8868078d90f4bd841be7ae4aa1b1c7381111e99792"
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
