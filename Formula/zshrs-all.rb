class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.5"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.5/zshrs-all-v0.12.5-aarch64-apple-darwin.tar.gz"
      sha256 "9a28bfa2bb1559f6a76ca4ae75366b623b07314d45298a8bcd5d21f99ce48baf"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.5/zshrs-all-v0.12.5-x86_64-apple-darwin.tar.gz"
      sha256 "2fd4923ddca8e45aab8a74fd787d3566ee76f5bb1950aa0713d22de0b32950bd"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.5/zshrs-all-v0.12.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0740105e6540017f580f4bb389176571aacc3a979ad88cc1a76c42393277faae"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.5/zshrs-all-v0.12.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "be933cd0e1dcba7e1d1fc74a2ec19512de0eda04f758f1cd730aee39cfab6232"
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
