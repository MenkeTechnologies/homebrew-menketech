class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.6"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.6/zshrs-native-all-v0.1.6-aarch64-apple-darwin.tar.gz"
      sha256 "175b529849c7ab701482073c321551bca41ad7ff6307ccdb219840f5700ea46e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.6/zshrs-native-all-v0.1.6-x86_64-apple-darwin.tar.gz"
      sha256 "0bf4ecd26d6cbc425e301556fdad8ef54ab891e8145b382afd9e72cf303f354a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.6/zshrs-native-all-v0.1.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f42c155289316ea20d297c9587df8ba33c6622bc242036f349fee72ff04610aa"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.6/zshrs-native-all-v0.1.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "80460fdac0c8cf05ff0fdd5f119bda04c62e3fabf3eb5741ad0cb4b96a551e0d"
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
