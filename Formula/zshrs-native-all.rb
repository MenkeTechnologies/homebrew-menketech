class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.11"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.11/zshrs-native-all-v0.1.11-aarch64-apple-darwin.tar.gz"
      sha256 "e03cd66572bb878f0fa646c0a52b0ad849093d656dd2bf3005a571117d12d506"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.11/zshrs-native-all-v0.1.11-x86_64-apple-darwin.tar.gz"
      sha256 "587c39b02917fbe3e46fe4dd439fc341086e8814bf86141949ce44beb97556e9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.11/zshrs-native-all-v0.1.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ae88fff1c6a51533d396549efddd4ddb5ea752c90949bcce1e594ef82517e1a1"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.11/zshrs-native-all-v0.1.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "26b6a26dd73dcd999382e9d190fc58ed78889e6d0bd0e0a21cafcf979291fd75"
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
