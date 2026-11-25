class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.81"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.81/zshrs-all-v0.13.81-aarch64-apple-darwin.tar.gz"
      sha256 "4948c627c926aa664640e9fc658ba31b459854b02926d758dd703b3f14c46690"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.81/zshrs-all-v0.13.81-x86_64-apple-darwin.tar.gz"
      sha256 "a2261e8bb5b82c48d2e082cadddbe01bb894196e6eb698329a9d022b1f1a5dc6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.81/zshrs-all-v0.13.81-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "57fe257ac7bbc00d013c8a1505761efc0316e823e2c5518759e59d08b94d41b8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.81/zshrs-all-v0.13.81-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "889ec043d527b1a56cf80fb83fefcb9e97da20169726fc419363448583a9454e"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
    bin.install "zshrs-recorder"
    bin.install "zshrs-daemon"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
    assert_predicate bin/"zshrs-recorder", :exist?
    assert_predicate bin/"zshrs-daemon", :exist?
  end

  # Static musl tarballs also published at this release:
  #   zshrs-all-v0.13.81-x86_64-unknown-linux-musl.tar.gz  sha256: 6f3d94f4187655efc504065d67da4978ca5de86f16181e3a4429cd3b3c6281c6
  #   zshrs-all-v0.13.81-aarch64-unknown-linux-musl.tar.gz  sha256: 8f73ed5f87ebd9bd07b05da4008fafa6cc637dfe64f579be19ce2fbef0e8279d
end
