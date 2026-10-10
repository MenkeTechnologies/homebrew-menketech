class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.34"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.34/zshrs-native-v0.1.34-aarch64-apple-darwin.tar.gz"
      sha256 "d267673770c76bb6a5ae3bdad28f6e5ed2f71a7bbdaa785110a359f67fd9dc9c"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.34/zshrs-native-v0.1.34-x86_64-apple-darwin.tar.gz"
      sha256 "a95247c854d7b5a4b6f72768341866e82f3cfc88f640adb4b31ede7a1ed3befe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.34/zshrs-native-v0.1.34-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4e8cec69ea2950f6ff20e880634e00592147982c8d57d88b1e91ad9f445924f8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.34/zshrs-native-v0.1.34-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "46ebf1e89fd0f67fc30d26bbcd6c1b9869c3fef5812ba6eb395c953c8f2604e6"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.34-x86_64-unknown-linux-musl.tar.gz  sha256: 15c6f9ee21342f93df50c8a621182f79475c82b7aba713839f454a5a7bb68a33
  #   zshrs-native-v0.1.34-aarch64-unknown-linux-musl.tar.gz  sha256: 31fc6816b1914648353672fcce4b174ebddc84021f35cd6346661bd159825f36
end
