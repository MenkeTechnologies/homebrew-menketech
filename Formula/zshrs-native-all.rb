class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.25"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.25/zshrs-native-all-v0.1.25-aarch64-apple-darwin.tar.gz"
      sha256 "5e94370c63292d20e13a637744731bf9a87ea0b3e1fc6b79cd2dbc1b4c3f4395"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.25/zshrs-native-all-v0.1.25-x86_64-apple-darwin.tar.gz"
      sha256 "4da7a6731e950dc4652d6307a79ad5e7809c525f4ef99a8182aed0f8f2125ae7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.25/zshrs-native-all-v0.1.25-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c7ce475e533072ad5aed60577e8fd2c945ca9ac7de37073ce4f6bdd376c36e4e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.25/zshrs-native-all-v0.1.25-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d3a10694e36afd490cffcee2b807d90e71ab8ee208af4102908cc8d89d970768"
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
