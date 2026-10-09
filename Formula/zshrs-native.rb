class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.27"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.27/zshrs-native-v0.1.27-aarch64-apple-darwin.tar.gz"
      sha256 "7fb6b5b80ee21aeef3fd5b765a5c4df64c02dd4336be81f88146cac5bea90797"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.27/zshrs-native-v0.1.27-x86_64-apple-darwin.tar.gz"
      sha256 "90f3a78828d775a54e3b99b799b590cf68c513dcf411f81be3e60fc4796ec2ed"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.27/zshrs-native-v0.1.27-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b7918f0b5e565b7933bfb8378a9de817c75f3532b072da0abb9b754889e12c81"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.27/zshrs-native-v0.1.27-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e6b1e8797480c2916b403ff14222f530ebc723fefefc7f9514c9dbb526e52a56"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.27-x86_64-unknown-linux-musl.tar.gz  sha256: 51827e4fb58917478bad583f7fa74b4da782a37bfba97c97598387c162925380
  #   zshrs-native-v0.1.27-aarch64-unknown-linux-musl.tar.gz  sha256: ea4865370ba19a8847638106917cea8b133b624abb7bdcd144c643c562be3f91
end
