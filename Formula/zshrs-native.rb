class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.54"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.54/zshrs-native-v0.1.54-aarch64-apple-darwin.tar.gz"
      sha256 "4df513beccb54c74ad1a75294542eaf2f297e2576a0a20e120e8da4ffe9b3c72"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.54/zshrs-native-v0.1.54-x86_64-apple-darwin.tar.gz"
      sha256 "ae0675e11aeedd4b3f1bbcc7a3b65379404e00ccd1f082a0fe1d9bfa70b14c87"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.54/zshrs-native-v0.1.54-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eebbf2ebe6b7d61a1ce461e3e06bc299a20869dedeca460079da956b75d777f4"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.54/zshrs-native-v0.1.54-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a55964aed813355dae50ef5ed3256a067a0f65b28f3a5bd2c62085d657bc5dac"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.54-x86_64-unknown-linux-musl.tar.gz  sha256: 7e43d388773c48d841d9eba6ae928c3aade6f4305c96f8471787ad7fc0414683
  #   zshrs-native-v0.1.54-aarch64-unknown-linux-musl.tar.gz  sha256: 7416908c655a6ec5dbbb0cb51f3221e538d5ef39f62e3208ceb3a64e898a541e
end
