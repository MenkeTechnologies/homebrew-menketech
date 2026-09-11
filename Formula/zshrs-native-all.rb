class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.10"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.10/zshrs-native-all-v0.1.10-aarch64-apple-darwin.tar.gz"
      sha256 "b420001585a3938c6211df95b2ab166847cf7f6fb5254a1b9c21bdc65f419321"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.10/zshrs-native-all-v0.1.10-x86_64-apple-darwin.tar.gz"
      sha256 "f261de8dbba2a59a8ead872693b5052549aa040acb8b384cad97ad6d059090a0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.10/zshrs-native-all-v0.1.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "efeff96a3ca6c2ee26c9f7f715dfa41f77a687d7669a527cde06c503abe9bb1b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.10/zshrs-native-all-v0.1.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cc7296adc794f7a19313026b5c4c00d88654fbe6e50b2c623c3fae06b11cdecc"
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
