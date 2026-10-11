class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.40"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.40/zshrs-native-v0.1.40-aarch64-apple-darwin.tar.gz"
      sha256 "e7007396d7bd881d293cb3fe172f44513d9027a757e47bafb0026b38d1f11ff4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.40/zshrs-native-v0.1.40-x86_64-apple-darwin.tar.gz"
      sha256 "9675f5e4132ce2eb2da3d1f4e61f7cf9efd31138b7f62d64d57fc36382b30fa9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.40/zshrs-native-v0.1.40-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "84762f3a2617482d1937dccf222a8795aa0d70d7ebaec6437d173253c69ca948"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.40/zshrs-native-v0.1.40-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ce773bb07a0682f655ac596e065499fecf3ed2a74b89902a7d95715ed5678428"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.40-x86_64-unknown-linux-musl.tar.gz  sha256: 9931ade987fabf9ab611b1eff36ec7d531c33fc8232b710a1c62f76aa79c86a7
  #   zshrs-native-v0.1.40-aarch64-unknown-linux-musl.tar.gz  sha256: 7118ca67c87c811df8e4a87280ab8e30e95f9df0d394de78d9a436a5e986d4eb
end
