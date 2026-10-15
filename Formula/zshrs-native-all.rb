class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.47"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.47/zshrs-native-all-v0.1.47-aarch64-apple-darwin.tar.gz"
      sha256 "08096df95b76301884584d890f3b27c677fed7df868e678863d618d06ebf4b4e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.47/zshrs-native-all-v0.1.47-x86_64-apple-darwin.tar.gz"
      sha256 "bb099bafcc72f98f1d32c56f13de1f63ed16885df21fd4dd766431ec1d723f69"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.47/zshrs-native-all-v0.1.47-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2122a0790c35d8d930a4d2789e11c58d719773cec6b1fce0d412cfd5a4225cb9"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.47/zshrs-native-all-v0.1.47-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f45616983e4502d67717c440a8331febd688d63592a189a48d6fc4d06a207efa"
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
