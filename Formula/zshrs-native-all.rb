class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.5"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.5/zshrs-native-all-v0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "b6f5cf5e72a2538bddacd1f51eae20bff87c922597e17a5fcfed551c8eb1136b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.5/zshrs-native-all-v0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "8f4270a624a5e6504c0d1039f53b790aaeaf157174adfb01698e132e28157ece"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.5/zshrs-native-all-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "56fb09fc52ab90627d94e962fc12d55e06a1d98eb0a018c31798f3cd5ddf171e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.5/zshrs-native-all-v0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1a6bf285e3cb37dcbdd9770818cae6732a2585f319c1ac78f9bcd9caef70d256"
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
