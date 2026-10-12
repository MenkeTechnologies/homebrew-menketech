class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.42"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.42/zshrs-native-all-v0.1.42-aarch64-apple-darwin.tar.gz"
      sha256 "50245d90281d15a66973ed479d3c0eac0008c6ff5644b23cd1461d794953f2fa"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.42/zshrs-native-all-v0.1.42-x86_64-apple-darwin.tar.gz"
      sha256 "7799b224a283f94f55c79816e70569f2cd7154ea514b320180cd67555ccc1f4b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.42/zshrs-native-all-v0.1.42-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "375099785d8116001d6362e485c787aac8ae4fd1b68bf471d9fe7fe1d4bfaa50"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.42/zshrs-native-all-v0.1.42-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bcbe1ed15124c0de5fee73bc8fdfc774b438ac5f7c42353e33b0067fd2170857"
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
