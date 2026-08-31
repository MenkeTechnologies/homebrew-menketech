class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.5"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.5/zshrs-native-v0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "4edf8e1cbd416c8c2a4c240a4af83f741d0bf872476661c57abf4d6d4c574f4b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.5/zshrs-native-v0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "16f91bdbc946bd223175c9d3531c4521467205b9a8c1922146db9d9a025be186"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.5/zshrs-native-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "245e917b7f54359e1bd146ca708dcc43aa8833e9fda32fdb0e76addc04af1e5d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.5/zshrs-native-v0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "785a7ec2f8f9fdf61ab67282defc477675bddf070cbecbb5b9a0b99be57f27eb"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.5-x86_64-unknown-linux-musl.tar.gz  sha256: 47d51c9f6970d1a710ef31fbb91f43d699987a33b38b3f23273f7c0bed5c641e
  #   zshrs-native-v0.1.5-aarch64-unknown-linux-musl.tar.gz  sha256: c1de6b28b93daff1dd541ffbdfd3b432232f016e3a368782e843a8b5c1d759a8
end
