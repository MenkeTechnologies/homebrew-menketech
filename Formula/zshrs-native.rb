class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.16"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.16/zshrs-native-v0.1.16-aarch64-apple-darwin.tar.gz"
      sha256 "a9efde424152ce4b9accfe0ae61b00f9ab98eda610ab4055c8be7338c8669e16"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.16/zshrs-native-v0.1.16-x86_64-apple-darwin.tar.gz"
      sha256 "57e5cc94ddd4b3df3cf5fb9bcbe2f3d11c3ec0ff5d2de9504ab6a5e0fdfb3620"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.16/zshrs-native-v0.1.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c17fceaecf0e778eab37a7b2bb74a41186bbc9303a558584a5affce2d811511b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.16/zshrs-native-v0.1.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "37be1b74f9c9b5a951574db92644aa39be751c993d3016b1d222cbf531b9d31e"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.16-x86_64-unknown-linux-musl.tar.gz  sha256: 28e08ab392315e09b2dcfeb592e618da9c751c1a8dd2c3be38702d8478ca7b29
  #   zshrs-native-v0.1.16-aarch64-unknown-linux-musl.tar.gz  sha256: b41b987b7711485e5d74c4f0c6715ab97412d58d300f7a71dfdac13e57df1623
end
