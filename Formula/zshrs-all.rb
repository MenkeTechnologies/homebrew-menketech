class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.11.40"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.40/zshrs-all-v0.11.40-aarch64-apple-darwin.tar.gz"
      sha256 "79d2a4cb732393c234db4eba4e4e2be92df0510b6cd6bd6dabda031efaad8f43"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.40/zshrs-all-v0.11.40-x86_64-apple-darwin.tar.gz"
      sha256 "ff00d300eef591aec9b7249381ecf2cdd9b6092614a5eebad1e56a71676a00b0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.40/zshrs-all-v0.11.40-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ff27bb54c7c2524d5b94e14435cd07953803b137d1b18f10e22ed8ebe816bc29"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.40/zshrs-all-v0.11.40-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a4daf02cd575df842cbd0b53e90fce7443b466f9254156db9058109a7e08bf59"
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
