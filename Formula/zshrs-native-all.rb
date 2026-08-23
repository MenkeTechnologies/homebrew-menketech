class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.1/zshrs-native-all-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "d5af89b5c0556cffa5395be5f01817c7fe3cae030d3f2611a1a27061d1b1aad2"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.1/zshrs-native-all-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "d8b4019a325942486d5b73649f2b9ad300ec5912722e3aaa0921979f80e58266"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.1/zshrs-native-all-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6478eaa7c775f97659b9989aaa53b3407610c1b4658dd60a38c16a5deac35ac7"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.1/zshrs-native-all-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8502712a8ece77c9eed44f25d4915f512222432f622825eb7e2824c924ea517e"
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
