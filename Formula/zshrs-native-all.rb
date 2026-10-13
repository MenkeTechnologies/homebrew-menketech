class ZshrsNativeAll < Formula
  desc "Full zshrs-native install — fat shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  conflicts_with "zshrs-all", because: "both install zshrs and zd"
  conflicts_with "zshrs-daemon", because: "both install zshrs-daemon and zd"
  conflicts_with "zshrs-native", because: "both install zshrs"
  version "0.1.45"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.45/zshrs-native-all-v0.1.45-aarch64-apple-darwin.tar.gz"
      sha256 "1a99df0b5194b3d9597e1a7716ed854a2dbe1e261d5696ece7892b684b60b5fa"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.45/zshrs-native-all-v0.1.45-x86_64-apple-darwin.tar.gz"
      sha256 "f8e7fd0122c1eb58e14ceb995b308d49b8196961d040ae33afd5027777f6c7c5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.45/zshrs-native-all-v0.1.45-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d169badd4fc91d4abb44ac9d794d709568aab4be125a0551e5a397310b7d3aec"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.45/zshrs-native-all-v0.1.45-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0d939c1fbea805b12f9355b6c712d7e590b182cbc01ebf305b5bf53b955565c6"
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
