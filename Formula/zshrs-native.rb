class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.36"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.36/zshrs-native-v0.1.36-aarch64-apple-darwin.tar.gz"
      sha256 "95746cbe9226887e8314dd06effcfd0413db08f2ed9078b349eec970f1c45b07"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.36/zshrs-native-v0.1.36-x86_64-apple-darwin.tar.gz"
      sha256 "a671a43544ab12accb3799861418f88284056a27a2774f4f2857ba2f290df51e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.36/zshrs-native-v0.1.36-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6688b3fea1f0b3ec9ab8883e732a5703584d729e5f873ab798118e79abc38aad"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.36/zshrs-native-v0.1.36-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4375c9e103f21e0a0c0efaa70b1b3ca51728d1ff022e0aff2a546c4ee8055542"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.36-x86_64-unknown-linux-musl.tar.gz  sha256: 09cd85a920706691afb90fbd15ccae4690055038e56b07b5d072e00539389001
  #   zshrs-native-v0.1.36-aarch64-unknown-linux-musl.tar.gz  sha256: 158bb1f3c7e4eed6342501834afadae0ec478521dd26ee35678a04a9ced1239a
end
