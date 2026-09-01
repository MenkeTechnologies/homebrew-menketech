class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.7"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.7/zshrs-native-all-v0.1.7-aarch64-apple-darwin.tar.gz"
      sha256 "64e9f25d38e93477c3681866175e94d3fc46e07abd8b1aea4be92e8bcb283258"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.7/zshrs-native-all-v0.1.7-x86_64-apple-darwin.tar.gz"
      sha256 "782f6c4649689f3cb4c00f7378e6d4bee37dc80f5fbc368fd5ac5348b8594c2d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.7/zshrs-native-all-v0.1.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2fb68c0ecf2414d69a9b2f188d48a58acbd0a0646b1497eb5f2a68c352d95dfa"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.7/zshrs-native-all-v0.1.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0fa28041f4a4c75f436b61ffa43e560b805f15a307dea088f2b3e3514ec2c78f"
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
