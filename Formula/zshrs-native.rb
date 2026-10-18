class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.53"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.53/zshrs-native-v0.1.53-aarch64-apple-darwin.tar.gz"
      sha256 "18ce1a38dcb495e5623cc771f33b4fb9fded35d48cd6e043b2b5b970279b8042"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.53/zshrs-native-v0.1.53-x86_64-apple-darwin.tar.gz"
      sha256 "d6fe67754b8c8613f57230ae42be6cae2d52fe1c1066de4e65d0a9387caf54ad"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.53/zshrs-native-v0.1.53-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b0e70b584c816eb60767937bff34c40095e538d420f367e07aa144943e13f8be"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.53/zshrs-native-v0.1.53-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9e8dc668551aeace6fcd612f00357ebbf04a5ba6768a6572378e8443e81a8abc"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.53-x86_64-unknown-linux-musl.tar.gz  sha256: 6f90c23b98ae8eb02ce1612ed78ae6921915ed94d6dfe56245d8528657dadee7
  #   zshrs-native-v0.1.53-aarch64-unknown-linux-musl.tar.gz  sha256: 5339a8f29c617fca093fa4e7f54e11b731b3f9081f38e84bb26d461a8aaa6599
end
