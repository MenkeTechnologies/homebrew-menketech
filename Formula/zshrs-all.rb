class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.16"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.16/zshrs-all-v0.12.16-aarch64-apple-darwin.tar.gz"
      sha256 "15a8192f5cc662d6089ca551dd87674016853075e26558991e940847e2505f4e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.16/zshrs-all-v0.12.16-x86_64-apple-darwin.tar.gz"
      sha256 "e7e3bdc01e77d040b0add804b00c77361cd88d5d2356c4dc4109234bf5b5204f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.16/zshrs-all-v0.12.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e9ce55e33974de76d4bb70f8e63b8bd9f4771e00e0fd2e255d070e93b0001e90"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.16/zshrs-all-v0.12.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2d6d6aee8ab19e45f0b575cd4b123f6387876b6421ec5bd6fa6aae1a3d9f1500"
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
