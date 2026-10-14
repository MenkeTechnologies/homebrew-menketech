class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.46"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.46/zshrs-native-v0.1.46-aarch64-apple-darwin.tar.gz"
      sha256 "edcba4ac36c974f945c30a6e930679fa90f7e68f54d7b96136d4535f99335670"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.46/zshrs-native-v0.1.46-x86_64-apple-darwin.tar.gz"
      sha256 "b484361b7e6df40339def95262586716ec30a301f7f40701eccb2c40d5239315"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.46/zshrs-native-v0.1.46-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6fdbf11bad9e9e2dad9254037ae33a506dcebb00736020e36b030176efc41951"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.46/zshrs-native-v0.1.46-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bd1523710263277ec983655271830ac6d672bb6cc08df15199c6b916607022ec"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.46-x86_64-unknown-linux-musl.tar.gz  sha256: 156d9f0053936fb498cfe7f2abe944d80c76605c7bc79f251d22f726a6c7a937
  #   zshrs-native-v0.1.46-aarch64-unknown-linux-musl.tar.gz  sha256: 9afe5a184de2fe1b3acae1e8d4091b0f5df422ecfc9d918d84ab0f282a389927
end
