class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.55"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.55/zshrs-native-all-v0.1.55-aarch64-apple-darwin.tar.gz"
      sha256 "fc16f49c2b695d7b02e2b9d10f2f91d8a7e20b71e5498597dfad5c2061a4ef4b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.55/zshrs-native-all-v0.1.55-x86_64-apple-darwin.tar.gz"
      sha256 "6447bbf0defc25ec0dffcf5cb67749e282b4fc3775bf8e47460d22be00c9e2fa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.55/zshrs-native-all-v0.1.55-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "54f9605b902638017d1414db6dc5db7684aa9297caf524a4cd636c3c2adf26ec"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.55/zshrs-native-all-v0.1.55-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5a0d127c5f86a3c52eec2b7a6124a2ad8ff523f1c283bfde769adbd1f6f4e715"
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
