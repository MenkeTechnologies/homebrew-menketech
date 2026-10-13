class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.44"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.44/zshrs-native-all-v0.1.44-aarch64-apple-darwin.tar.gz"
      sha256 "91b7725bd00ee119b68c398a37de5f66bdfb3442cdf009b49b083ea47c030791"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.44/zshrs-native-all-v0.1.44-x86_64-apple-darwin.tar.gz"
      sha256 "f95224fef7f9f71954dcc776950ab0a546bed25d06a6bde86d895f788042e82a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.44/zshrs-native-all-v0.1.44-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0887c877a5f89e89745a9c2cbe840fb8f358c3071a6a954dd95cfc8c2c950fb1"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.44/zshrs-native-all-v0.1.44-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ead9d4d75e897ba24f5ef43bbd98e51ec75683da68b066c791be96737107dac5"
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
