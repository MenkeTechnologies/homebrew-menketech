class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.35"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.35/zshrs-native-v0.1.35-aarch64-apple-darwin.tar.gz"
      sha256 "f83a50d9c63d5c2cf78f2c8edadb01e1462b3a00bdc58bdb31308fe7927bf098"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.35/zshrs-native-v0.1.35-x86_64-apple-darwin.tar.gz"
      sha256 "0099b99d00dbe23781b073af9a3f0886b78e60f5d3fd436f56440548062aa18c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.35/zshrs-native-v0.1.35-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "22b2389c6aff116c642c0b62d4749892965bfe8cadd200d819f5bb17f03d70cb"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.35/zshrs-native-v0.1.35-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d451b6208c7e4b7796aecd07503dbfc3a8b84c3c3dcd485ea1f5653943a8d4e1"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.35-x86_64-unknown-linux-musl.tar.gz  sha256: 745214511e3d5ee11d5c5e33dccd68b6d19988efe5cde27fb2cceae5a8569eb1
  #   zshrs-native-v0.1.35-aarch64-unknown-linux-musl.tar.gz  sha256: 190200a7a3e1cd5bd327ff690a79e1a374134026edf170d9fa30ac87ab2ec3a9
end
