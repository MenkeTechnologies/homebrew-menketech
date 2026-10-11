class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.39"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.39/zshrs-native-all-v0.1.39-aarch64-apple-darwin.tar.gz"
      sha256 "9cbfacef464b272fa9d644bb1db6fc48866c7df8857b42ec746e1c91f05af996"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.39/zshrs-native-all-v0.1.39-x86_64-apple-darwin.tar.gz"
      sha256 "2cb22ba27e1b3a2c23a7815e1259204842584af56fa2e14fad7db3c6660259d1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.39/zshrs-native-all-v0.1.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f063a0a208d4bc6cbb5e4077767d73b6e2726736af47d0c635baf24e2fc4221b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.39/zshrs-native-all-v0.1.39-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5718082d5e6d615c2a8c7087417e2a123a6d182a6383f3a187c044a48fb1154b"
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
