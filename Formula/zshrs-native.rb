class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.47"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.47/zshrs-native-v0.1.47-aarch64-apple-darwin.tar.gz"
      sha256 "e7fcdf49f956efcecd1db20a0e25054de046c20271ef621fcc5ed228c8c1904d"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.47/zshrs-native-v0.1.47-x86_64-apple-darwin.tar.gz"
      sha256 "c17ac64c30a289295b857e33875a7a9bae0d9e2806bfeb065e608198d8a815fb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.47/zshrs-native-v0.1.47-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "90461ad8cc2630fd28167645701547ec477954f8a3a01025a274d89bb42792eb"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.47/zshrs-native-v0.1.47-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c7573f2769e3b37961097aac2369ecfddaefbd5402cb4c49c81a0d4289f56224"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.47-x86_64-unknown-linux-musl.tar.gz  sha256: 9039c9256429b2c49eec2124cc7106a256b15bc1ae8407c9e3620003e4446cf0
  #   zshrs-native-v0.1.47-aarch64-unknown-linux-musl.tar.gz  sha256: abe78a356417130ed7576b8068faa722e7934decb1505beb37694a1aff28952f
end
