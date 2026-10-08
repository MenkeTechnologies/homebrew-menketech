class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.26"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.26/zshrs-native-v0.1.26-aarch64-apple-darwin.tar.gz"
      sha256 "1b114372008b3b9aee923d3985fb6eceead462eeecd275f29f19c25c7faeb44f"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.26/zshrs-native-v0.1.26-x86_64-apple-darwin.tar.gz"
      sha256 "c68bb6898e09e57a7708111e44e9638e233ba687c8f220eec0792da5a111a4c8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.26/zshrs-native-v0.1.26-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9d84ccce49fd1a2d67b6d136f06fdaebc7cde680b100c1dde27c7465229e0810"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.26/zshrs-native-v0.1.26-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8bd6667496c5ac1d71fda486b3ba6f771438f749b4e079078f8575d469e7f492"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.26-x86_64-unknown-linux-musl.tar.gz  sha256: 24230dc6c8a411cee9421decb239cd5f33b3d8f55a186152e5eeda077c6d45bd
  #   zshrs-native-v0.1.26-aarch64-unknown-linux-musl.tar.gz  sha256: 5cedf56e9e1827707174eb74faf1c229c9fc56b14aac80fbc165a5c7c4600778
end
