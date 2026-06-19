class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.11.47"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.47/zshrs-all-v0.11.47-aarch64-apple-darwin.tar.gz"
      sha256 "7e9c96a8e5f062ec5e58bc8bff0bfc4d11534707ddd522637de0b13e4f546456"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.47/zshrs-all-v0.11.47-x86_64-apple-darwin.tar.gz"
      sha256 "adf3c8e29c81ec4e6a1862901ea0d7b9e2409a98c1c5c870008562369459e461"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.47/zshrs-all-v0.11.47-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ec5d6e6f4f0f14fad8f3af302eee3389c61751cfe40012839e3d16bf0439e19d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.47/zshrs-all-v0.11.47-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4782e2b3b1f4e4055187cafd8282551651652db99903dae06275b453285d6bf2"
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
end
