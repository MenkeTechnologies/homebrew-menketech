class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.53"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.53/zshrs-native-all-v0.1.53-aarch64-apple-darwin.tar.gz"
      sha256 "b0a8b5cdf56b236b76bca044ec299c9d2d3afef8c4d1ccea3a2664a635c50643"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.53/zshrs-native-all-v0.1.53-x86_64-apple-darwin.tar.gz"
      sha256 "cb0549283baf97196b162b3213e0d93f2de52409279c88d14a575ddeaef3e7d0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.53/zshrs-native-all-v0.1.53-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c0f35690fa666c859eb33dd9e3a86e3a1ab675ad2cfbdc432f8765ceb0354b41"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.53/zshrs-native-all-v0.1.53-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "58e21eacbcb9bb478794ddf685fab1998be9f432068cad1847ca10a520e6dad7"
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
