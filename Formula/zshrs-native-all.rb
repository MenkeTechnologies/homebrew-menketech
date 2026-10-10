class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.34"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.34/zshrs-native-all-v0.1.34-aarch64-apple-darwin.tar.gz"
      sha256 "07fbe8399a7d78f3c134a686adbb3fbbb13b19efd9b0cfa2a7ec0e21e5992929"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.34/zshrs-native-all-v0.1.34-x86_64-apple-darwin.tar.gz"
      sha256 "ec1872c232a6e8f62fce9179217c5997e4811f91deb8a6fa1a8547ba4f3fe039"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.34/zshrs-native-all-v0.1.34-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "70d0e5cca0587b2c12572fb25194f9b033c25a464f1220eb96a5e78681156317"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.34/zshrs-native-all-v0.1.34-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e55c4db5cdcd841ff8f079780dc1fce14cba0e9c3456c3795c2808d235cfab46"
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
