class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.35"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.35/zshrs-native-all-v0.1.35-aarch64-apple-darwin.tar.gz"
      sha256 "4e0443f44ebaaf4ac1e5e8abc1f2a4589e4627cb8139165a6d43e7322f619273"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.35/zshrs-native-all-v0.1.35-x86_64-apple-darwin.tar.gz"
      sha256 "2581815aac3c8b660ae1214d7d776b46ca121f02fac33d0037fcb5f64d02f4eb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.35/zshrs-native-all-v0.1.35-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1d4031b14308a361b2ddf935f0a6de8345744916e5caae123965bda8d3e24eb0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.35/zshrs-native-all-v0.1.35-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "24abe9eb0206fd02ad508bd29fd7cf5ce71d6f7a347adb5dfbb84adc481c9354"
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
