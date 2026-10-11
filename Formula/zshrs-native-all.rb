class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.40"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.40/zshrs-native-all-v0.1.40-aarch64-apple-darwin.tar.gz"
      sha256 "c2155623fdcacf0d77a6f3972e8d7a8f648ef7b404abdb020a5eee815b2587d1"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.40/zshrs-native-all-v0.1.40-x86_64-apple-darwin.tar.gz"
      sha256 "cafe5ff87a6916afc8dac39fe9ec8acb64cdb64a2fe316ee25de629c046ff163"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.40/zshrs-native-all-v0.1.40-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "633774f4d315214c50838cc76a9fb1665dab177d196dd957b9a743ec0650e0b9"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.40/zshrs-native-all-v0.1.40-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "96bf9510d51330d607bebeabdaafcee2f8bcb6ba03d842b443ddfd0797226ba8"
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
