class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.39"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.39/zshrs-all-v0.12.39-aarch64-apple-darwin.tar.gz"
      sha256 "8b6a2370e7b8d283ef1ec4c62048d5dfde22602a8f4e279a47361fc58a0a0404"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.39/zshrs-all-v0.12.39-x86_64-apple-darwin.tar.gz"
      sha256 "d550f99be6a8080cbaafba656ec2d833d8b32751613994d95cd81a424c2c6a54"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.39/zshrs-all-v0.12.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "14ff31c558d9b26254436096015fe931914bf6a73440ea9913da359a78cf501e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.39/zshrs-all-v0.12.39-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "359b8edcd252bb7244c780110714a24a4a9d2494731c9f56a4eb956eabeafad6"
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
