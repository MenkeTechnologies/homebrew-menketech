class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.11.19"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.19/zshrs-all-v0.11.19-aarch64-apple-darwin.tar.gz"
    sha256 "ba042133f558238393767145f2f3234e7ef12376547f425929ce36131f1f0665"
  end
  on_intel do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.19/zshrs-all-v0.11.19-x86_64-apple-darwin.tar.gz"
    sha256 "963be49f2efdb170c53f38a79ec2d6f1e438fc527acb542c952d0c0fc2b6ca74"
  end
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.19/zshrs-all-v0.11.19-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8439a40cadd85502f754b1fa2af3858d55d832b2e6e0dc71fe869e2125ca8ecb"
  end
  end

  def install
  bin.install "zshrs"
  bin.install "zd"
  bin.install "zshrs-recorder"
  bin.install "zshrs-daemon"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c \'echo hi\'")
    assert_predicate bin/"zshrs-recorder", :exist?
    assert_predicate bin/"zshrs-daemon", :exist?
  end
end
