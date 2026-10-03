class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.17"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.17/zshrs-native-all-v0.1.17-aarch64-apple-darwin.tar.gz"
      sha256 "fb029aab364f0965dcbfc8034a3c4ab03f446438af2310e593b554ed7ae50818"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.17/zshrs-native-all-v0.1.17-x86_64-apple-darwin.tar.gz"
      sha256 "e309c78baf75c34ea156b281e4499966bc5b39ed64c70a32c97b0684f76dfdd9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.17/zshrs-native-all-v0.1.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1dfec6b007622f6c71d5207beac152ae3f3c2ff1b4bbb9eb2dc5b903d6d40649"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.17/zshrs-native-all-v0.1.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "da4b0e44a22267fcde2e3acbdb81e234b8602a959a2576f7b52ef25f8e2d9636"
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
