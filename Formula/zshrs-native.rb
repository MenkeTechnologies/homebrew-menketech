class ZshrsNative < Formula
  desc "zshrs with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.0/zshrs-native-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "26a50eca534863c9bba9fcfc42b0e6f7f16256d1b5386f10ba9ae8e69f7065d5"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.0/zshrs-native-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "d874e469151975b6749c496aeb66b5fa570dc29565b4438bb76394eaed0566fb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.0/zshrs-native-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7d3b0c4b4fbd7b6c04ae8fbc84ed2e3ac34340656b1776bd712e02823697337c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.0/zshrs-native-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ee5fe2fbc7c965ef3fe26da82e4b88d3cb1424855f56bd449c6d38ad2d6b1e59"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end
end
