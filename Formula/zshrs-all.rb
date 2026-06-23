class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.2/zshrs-all-v0.12.2-aarch64-apple-darwin.tar.gz"
      sha256 "0b54a5953ae9566357bdda428411798c87d7ad6196ea26c6f50f8bdc4ef7b9ff"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.2/zshrs-all-v0.12.2-x86_64-apple-darwin.tar.gz"
      sha256 "797ebe71dc06eedd50df804bf48cba32191587db906148510dbeb247c2bc509e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.2/zshrs-all-v0.12.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3a444b978ded87b7b29d47fe9940fd8f82264d5b4eae2112fab2041a14b2cacc"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.2/zshrs-all-v0.12.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b2d8fe840f2da0ca429e19fb1de4f3b12621dabd08b34d28ffbcb560d6a39c54"
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
