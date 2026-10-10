class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.37"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.37/zshrs-native-v0.1.37-aarch64-apple-darwin.tar.gz"
      sha256 "27966113d1ced0991675107a3c3f689415ed72e7159a15848373ed9ae1590754"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.37/zshrs-native-v0.1.37-x86_64-apple-darwin.tar.gz"
      sha256 "2de480a3711575516b0a631502335673b40b199afd2af4c7d5b34ef8f7305f99"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.37/zshrs-native-v0.1.37-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3f07a88bf09aa080ae24146127ef0fa92027baa3c0e3d9f57eb6783cc57859de"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.37/zshrs-native-v0.1.37-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1411095daa6f7d295f3516258b97155b775c94ecc330fae64f804c770d0bfbab"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.37-x86_64-unknown-linux-musl.tar.gz  sha256: 971521dac344e89c2e2b7859877b0a8725a2165e7d28d9e43fa159e24742ebec
  #   zshrs-native-v0.1.37-aarch64-unknown-linux-musl.tar.gz  sha256: 2dab15713f44a8a38d6fb2a89c324419d022077509762c4b406116977ca9689b
end
