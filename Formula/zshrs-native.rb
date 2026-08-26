class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.1/zshrs-native-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "b42f9f34810088adc33c51bf45fa63f112d230a4c9fede722f474da463c254a7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.1/zshrs-native-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "a043d14a7dec4158ce971fe480e28815ec5199165f75e1f3cf591f741554b5ef"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.1/zshrs-native-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "40e4fcc67f6e0068d9d451dd078e5ba96c9f0f5c2eea15b7ce49e8c485eebfaf"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.1/zshrs-native-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "48844f02f131dabc54c5f06c0f7c7158b1a6b05c8b371f3fb08b92be3d8f11b2"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end
end
