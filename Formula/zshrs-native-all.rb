class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.54"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.54/zshrs-native-all-v0.1.54-aarch64-apple-darwin.tar.gz"
      sha256 "3db69705c99ef518683b624b4325ae3a4f1c79d0d41ad4bcee7cbc06a1e5cb31"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.54/zshrs-native-all-v0.1.54-x86_64-apple-darwin.tar.gz"
      sha256 "03f206779710d812aa80c59858e97bc1f7d471585e728658e69d762d00fa5266"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.54/zshrs-native-all-v0.1.54-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "70f18fe06c5a9db9f0defe6b3aa245fc79bd52c20f1d7c8e52a941d4c35249be"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.54/zshrs-native-all-v0.1.54-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2a047e18519c80dbfcb34a2a066847ea0d04cd33938d6e13196feb5c875cd9f3"
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
