class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.9"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.9/zshrs-native-v0.1.9-aarch64-apple-darwin.tar.gz"
      sha256 "24eec898a3eabf0f02002c8aaf73eeea6b1f018eaca6eb898c89f59af907e80e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.9/zshrs-native-v0.1.9-x86_64-apple-darwin.tar.gz"
      sha256 "4458e304025e17c10f88b4d2a3b9de72bd52aaf4bb6e5bace120c86a8945885a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.9/zshrs-native-v0.1.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9cd46ac79bd34910fc811de11c662206b41aabd304f02f5bb77b2f9e99b613ec"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.9/zshrs-native-v0.1.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ad809ad2d659592478e8da90f9fe8cea21d5ae0743dd938904f5c7b0e78a1261"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.9-x86_64-unknown-linux-musl.tar.gz  sha256: e6a85ca65aac9fe817eb9427a71e93418bb5989974a71f7292c23a6773bfb42b
  #   zshrs-native-v0.1.9-aarch64-unknown-linux-musl.tar.gz  sha256: 31b433a3c5a67407c3a6e9ed522d6416c727a4c3961a266d0754b5fa2153e610
end
