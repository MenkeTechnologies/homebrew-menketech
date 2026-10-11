class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.41"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.41/zshrs-native-v0.1.41-aarch64-apple-darwin.tar.gz"
      sha256 "c45ccb40e556029b27e33abafcfaa9d154a539dd7020d8d7beb5347559f1a0cc"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.41/zshrs-native-v0.1.41-x86_64-apple-darwin.tar.gz"
      sha256 "ecb62bb9f4a9c87a2f7cbe00c23674fd46663829d0887a20607692b1f455e2b0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.41/zshrs-native-v0.1.41-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f091219319a7481eff0e28925c548de3bad330892d96657897ce836c778d888f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.41/zshrs-native-v0.1.41-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3adbb0982dfbe2a4c482845200455b47214cb77896d69af9f1106c8813a594a1"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.41-x86_64-unknown-linux-musl.tar.gz  sha256: 744661fd8e093e9010fe6a191fcc13c6941a3bf48a4a299cad0c9ea5aeb2270e
  #   zshrs-native-v0.1.41-aarch64-unknown-linux-musl.tar.gz  sha256: 2a3ea27ddd7cd980cf6557edf7232abc4bfa05ee8f063e8b41f1a06a56eeff80
end
