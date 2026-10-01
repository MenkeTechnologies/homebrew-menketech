class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.12"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.12/zshrs-native-v0.1.12-aarch64-apple-darwin.tar.gz"
      sha256 "4749253a200930ffffc06eea8c41f6f9b30cc86a96de9848a78e50c45f2a43a4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.12/zshrs-native-v0.1.12-x86_64-apple-darwin.tar.gz"
      sha256 "6ace8ced9cd93b675e4256775d9abe2e08047c2d3a1baa49bb9f31093dc8e16d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.12/zshrs-native-v0.1.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4b34e21ed771750d39fb7c798556f2cb11cef0b928322b8b4aff480b76b45e89"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.12/zshrs-native-v0.1.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cd17d85f1b4e57944d90adb35f3e98b479f44bc18744d54b62dbb94b10371b3d"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.12-x86_64-unknown-linux-musl.tar.gz  sha256: 2f6adae02f08057342161f81183caef4b98340a68dca639bbd59b66edcafcb30
  #   zshrs-native-v0.1.12-aarch64-unknown-linux-musl.tar.gz  sha256: abafba534276a608e18d9a13169947a4b0349032efa29a6389abf741aa292da7
end
