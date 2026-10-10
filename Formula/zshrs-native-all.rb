class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.29"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.29/zshrs-native-all-v0.1.29-aarch64-apple-darwin.tar.gz"
      sha256 "773f48c3c12d7b21e89fa4bb6951fcfd4ca25949e7f22088a8dd6406685fb3ee"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.29/zshrs-native-all-v0.1.29-x86_64-apple-darwin.tar.gz"
      sha256 "f7e7534d1550acd51861ab9f832c41c084c60ff4ca45227413af5b2fd3ba80ad"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.29/zshrs-native-all-v0.1.29-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4ab77a0772d6ae8156d8b09bdcff243ff4a8eb4f8b72882684420fb33d80c841"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.29/zshrs-native-all-v0.1.29-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ed02f3dd752091f7d95d3ea9c70a5c13b8187e6240e106b95fdf6e85f6ee8bbf"
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
