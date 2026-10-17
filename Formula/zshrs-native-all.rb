class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.51"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.51/zshrs-native-all-v0.1.51-aarch64-apple-darwin.tar.gz"
      sha256 "bde98567f4cfe62d920b5256e7e8a13322e68528ff1a9f82ebf8f9c8676c17f3"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.51/zshrs-native-all-v0.1.51-x86_64-apple-darwin.tar.gz"
      sha256 "e29aa1b3b57ab093f2318c20dd6941a210821b5bbd3e1425b5aaba4ff85ed515"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.51/zshrs-native-all-v0.1.51-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a442f30832a097a844ad24df43455ea1f104ccf416700487ebc5757e53225cf5"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.51/zshrs-native-all-v0.1.51-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b9a6943eb0cf9357ee489b8d403a540257e8b78520901211cb9e634747cd14a2"
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
