class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.22"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.22/zshrs-native-all-v0.1.22-aarch64-apple-darwin.tar.gz"
      sha256 "b1aa762c2d815cb24d2914973223c34e7c5f461db7f4656694ede17e6e5c50d8"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.22/zshrs-native-all-v0.1.22-x86_64-apple-darwin.tar.gz"
      sha256 "f7059e40021a7e599be9528e25d6eb70e5d7bafe47f6a25512cbc5f7394f71b7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.22/zshrs-native-all-v0.1.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e47842f7f0104cffb56f9176022c253ad1910764f69336ca9bc17b9ddacd3c5e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.22/zshrs-native-all-v0.1.22-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5dddca5bb118f749ad9f21d7d710f7dc14d840c0ea5102c37c04564632966f0e"
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
