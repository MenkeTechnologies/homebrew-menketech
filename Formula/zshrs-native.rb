class ZshrsNative < Formula
  desc "Fat zshrs build with git, arb and stryke compiled in as no-fork builtins"
  homepage "https://github.com/MenkeTechnologies/zshrs-native"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs"
  conflicts_with "zshrs-all", because: "both install zshrs"
  version "0.1.25"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.25/zshrs-native-v0.1.25-aarch64-apple-darwin.tar.gz"
      sha256 "dddbdba4eb7d95cf70388bb04b7f0a69f97ca009b99d4588963f87f4ca5e3375"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.25/zshrs-native-v0.1.25-x86_64-apple-darwin.tar.gz"
      sha256 "0da5c6c3454a2b8013fda956ee9dee2a481adbdce9b1d06b37010e8b13b47cb5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.25/zshrs-native-v0.1.25-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "981ebaf96e1c6aa2efe5021adaa687cdec43d5435f44b2c17cf4d252f25d4ffb"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs-native/releases/download/v0.1.25/zshrs-native-v0.1.25-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bf746c1691e9dc6a7a342a51d02559370eb96ae1ac73387ee87d1fd3087c1936"
    end
  end

  def install
    bin.install "zshrs"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-native-v0.1.25-x86_64-unknown-linux-musl.tar.gz  sha256: 713a6aab29b11249a6d3cc2d76ab012e5cd7ecfd6de7795d985cc8722768b487
  #   zshrs-native-v0.1.25-aarch64-unknown-linux-musl.tar.gz  sha256: d184e1b16faeb49356d57e0266da832741b2cb1a3c864f01130164be0984887b
end
