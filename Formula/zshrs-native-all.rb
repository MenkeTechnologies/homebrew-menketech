class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.19"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.19/zshrs-native-all-v0.1.19-aarch64-apple-darwin.tar.gz"
      sha256 "4e6c852229b721f6f91a31149a4c3c2a4360dc67ed9d576bb9ec243b639519f3"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.19/zshrs-native-all-v0.1.19-x86_64-apple-darwin.tar.gz"
      sha256 "b75f006dac813c08a94b2050f5f8774caf3c659e8a33c83b1e07f530538dcdca"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.19/zshrs-native-all-v0.1.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "be0caaa6acc75f54e14bc5f5c12735d41f1e6c5d67a350aae70b39272e47188a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.19/zshrs-native-all-v0.1.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ea68cf45e96b117c427342a17cb06961b85054b95571917d56f8f4f227c7a147"
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
