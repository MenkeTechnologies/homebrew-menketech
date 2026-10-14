class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.46"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.46/zshrs-native-all-v0.1.46-aarch64-apple-darwin.tar.gz"
      sha256 "3d2c64a1f885ca502b58c7730bb29eacf455cb7d19de3ed9b526db6261b5d515"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.46/zshrs-native-all-v0.1.46-x86_64-apple-darwin.tar.gz"
      sha256 "81acc59426e8bc4f0a05cbdae42efa1d4b24ca842e4e26268d17adb22a9e2e1f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.46/zshrs-native-all-v0.1.46-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c7e016d9fd7f0119d5375f0332aefcac09fe973e850904aff3e039e25aa755f4"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.46/zshrs-native-all-v0.1.46-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "554b72323af42bd97dfb59de515d5852bae7ecdb36608d7bc12d1369ecfdc131"
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
