class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.11.18"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.18/zshrs-all-v0.11.18-aarch64-apple-darwin.tar.gz"
    sha256 "1968c4dd87a55a60a348efa6045af2d984a88979e237349fc9bafd61b9017531"
  end
  on_intel do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.18/zshrs-all-v0.11.18-x86_64-apple-darwin.tar.gz"
    sha256 "c215ac2c51ead4e3051da38272f4a1df8615050ee5269ff6792e9889ce45e26c"
  end
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.18/zshrs-all-v0.11.18-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4d209e6f85f0075a872bc57e71efac8cde994dda91276e717f9bf2aa8e5136bc"
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
