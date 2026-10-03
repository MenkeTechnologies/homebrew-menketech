class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.21"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.21/zshrs-native-v0.1.21-aarch64-apple-darwin.tar.gz"
      sha256 "66beeb762cac20c9bbf32f47d978816717761fd8cb0a1b3d0c10901d42122303"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.21/zshrs-native-v0.1.21-x86_64-apple-darwin.tar.gz"
      sha256 "6db68e59386a9ba41342cb38d4dfad6943c3d4011b465ea5afe88d3285d31490"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.21/zshrs-native-v0.1.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "62642428e5026dea7afc6a0e56f131526e1cf4c11c91a5969e6ce749c58f3dc6"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.21/zshrs-native-v0.1.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "50af9147a7f0b78d52416b6c395942dc9e6afe56143b9f9f2265fc4e0572f5bd"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.21-x86_64-unknown-linux-musl.tar.gz  sha256: 5f6c94f96765a93e3926b1d0f7acfb34494ceb9ea4d3aa8be55e20adcef66a82
  #   zshrs-native-v0.1.21-aarch64-unknown-linux-musl.tar.gz  sha256: d900767841be71ffa826f2c868eebc1e359772b1b43c0de6f19b3572544917e9
end
