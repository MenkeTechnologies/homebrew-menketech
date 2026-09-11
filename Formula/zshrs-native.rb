class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.11"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.11/zshrs-native-v0.1.11-aarch64-apple-darwin.tar.gz"
      sha256 "d22818a94f63df1ada652dc1829354e3524f1a783ca130e2b7066566fc395728"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.11/zshrs-native-v0.1.11-x86_64-apple-darwin.tar.gz"
      sha256 "c7a8f6f9ea8aef415fe7a57c7848e2eb1246307929b0592aacc095c3895ab974"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.11/zshrs-native-v0.1.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "72a3fa024fa5deccb3c3e977fadbc7f1e9f80b6cc46ab4d40d950158c29155c2"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.11/zshrs-native-v0.1.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "32ba29d2dbb4ca3aec5dab6fccdee2bd8f0f9352045ecd206b7d755b06faef60"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.11-x86_64-unknown-linux-musl.tar.gz  sha256: eafcb3075e4facba566d15ee2905f8a1098a30957556145d8d1863e61135a05b
  #   zshrs-native-v0.1.11-aarch64-unknown-linux-musl.tar.gz  sha256: 683bfe88a0aa648acae52619da5556660431161535d6a2209251dc8ea2ffe3f5
end
