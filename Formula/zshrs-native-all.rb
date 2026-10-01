class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.12"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.12/zshrs-native-all-v0.1.12-aarch64-apple-darwin.tar.gz"
      sha256 "d0960f9617929c11971e4d1abb8d1f2c0c446ca84ef56369dcf335be867723fd"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.12/zshrs-native-all-v0.1.12-x86_64-apple-darwin.tar.gz"
      sha256 "c679a7dca24a96e55c7dfe00e18cb67c59443ddd3a43ac98140b07cd6e6e7c57"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.12/zshrs-native-all-v0.1.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ae1f953fab4bbb20edae58d03406ac863a3495d2de5522123e16d98355a8003a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.12/zshrs-native-all-v0.1.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4136234bc09340f3489db3aeb63d548efa522363685771eebfe84b294ec3ba72"
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
