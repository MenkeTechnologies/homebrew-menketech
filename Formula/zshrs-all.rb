class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.65"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.65/zshrs-all-v0.12.65-aarch64-apple-darwin.tar.gz"
      sha256 "376a6922d8abe316c3d13706adb50059b63499b725ceb7a3b710a68ce4d80afe"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.65/zshrs-all-v0.12.65-x86_64-apple-darwin.tar.gz"
      sha256 "f9e214018e7d3867672b967f638235a0655afea8c8db3d744a00b30c598279bc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.65/zshrs-all-v0.12.65-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f7e3847515f30f587fdf52296998009464277b3c9e2513e85532da3f8901701c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.65/zshrs-all-v0.12.65-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a1d404ecae7726d6632f4df1f61d0d9a8c2006962b98c396388709232510b731"
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
  #   zshrs-all-v0.12.65-x86_64-unknown-linux-musl.tar.gz  sha256: 7202fa226aa9ba6f3e80fcfd39c038ae37f0ef76227b3ec06dbc273d41125f92
  #   zshrs-all-v0.12.65-aarch64-unknown-linux-musl.tar.gz  sha256: b25282f66965583e150bb4787f0bfe9c2c0faedd4fd61a6ae30891c61c253465
end
