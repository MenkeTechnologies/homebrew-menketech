class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.37"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.37/zshrs-native-all-v0.1.37-aarch64-apple-darwin.tar.gz"
      sha256 "8cc7b14780991c3f31470613b3eb610675cc199596826a400db515b5b9a5de7d"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.37/zshrs-native-all-v0.1.37-x86_64-apple-darwin.tar.gz"
      sha256 "b8fece5b4d4db8317eca0e1d03d85e9f6f7ecdfb70b58100e210adcdfa2616cf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.37/zshrs-native-all-v0.1.37-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "110a1e2264068ab05847ffcdcb794b060df10393fbc9baf0ea69ed5c25a7b00b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.37/zshrs-native-all-v0.1.37-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "25c89901dbf0cdbcf291ff92fbcc92c409efe5dbe76bffd37819877e5c7516c5"
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
