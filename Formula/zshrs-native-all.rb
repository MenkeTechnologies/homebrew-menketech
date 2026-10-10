class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.38"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.38/zshrs-native-all-v0.1.38-aarch64-apple-darwin.tar.gz"
      sha256 "c5258e81617128fac5d77eb820753f594ad421e774b2e015395194e64f75041b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.38/zshrs-native-all-v0.1.38-x86_64-apple-darwin.tar.gz"
      sha256 "2c2ab73a2e79e4d61ca9a8b078a575ff1ea73246763e5ad37c6ad0b56ca2584c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.38/zshrs-native-all-v0.1.38-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "88db211e8ba9a53dbe2ee14b3600ba1d8cd0165637f60aa2984fc9abfef2c75d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.38/zshrs-native-all-v0.1.38-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5bcde7699c981eb44be201677595af57ac7561efdb3895985d93b42f463cf985"
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
