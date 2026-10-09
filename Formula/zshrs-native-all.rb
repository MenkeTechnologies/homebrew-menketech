class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.27"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.27/zshrs-native-all-v0.1.27-aarch64-apple-darwin.tar.gz"
      sha256 "77d449fa228d1215a9edc4e5567b6194ad24c514c9e95559f9d4a5b5a04dc1ef"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.27/zshrs-native-all-v0.1.27-x86_64-apple-darwin.tar.gz"
      sha256 "49c11a70becda49b60452dafbb25572c556dc7c18c9c23528954e495acaf19a4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.27/zshrs-native-all-v0.1.27-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f75dcb555d2dc9d974dbc7ca12523dea2c1d2664a8d8ad2299c5b10e3a80e385"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.27/zshrs-native-all-v0.1.27-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "83dcb655256c266932b6149338c398353e008674b44aeb1e75ce9f20ab8805f2"
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
