class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.41"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.41/zshrs-native-all-v0.1.41-aarch64-apple-darwin.tar.gz"
      sha256 "27928d9ce02688423cfec9bcad50a6064d8b5d3ecd24080111cfd1293cbfa2e7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.41/zshrs-native-all-v0.1.41-x86_64-apple-darwin.tar.gz"
      sha256 "ca6dad60dcec1586c9b111e4047f94abc7ed1b851b1cc382f6cec09de9befc58"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.41/zshrs-native-all-v0.1.41-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7a2119ac54a4f87f4f5847b62581b4ddb350d1099dec90e4766fb0f708cc2c69"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.41/zshrs-native-all-v0.1.41-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b12b6ef5e7d6023b3e99be71d192b1cc6a061b58053ddb3bd408fe17ca003fe4"
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
