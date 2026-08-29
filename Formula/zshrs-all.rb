class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.43"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.43/zshrs-all-v0.12.43-aarch64-apple-darwin.tar.gz"
      sha256 "a407575845fc8b762cae7aab68620f23aab533bea60360b41f2b65129fab6d68"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.43/zshrs-all-v0.12.43-x86_64-apple-darwin.tar.gz"
      sha256 "c44d8bd3b95694e1a9c876246595fffeed196c4d999e25c072186da504d2154f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.43/zshrs-all-v0.12.43-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "53eb9fc0b84850059532fa3f81a5e6c31c1fe745c976b3f8d05ee1ce3fa79e68"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.43/zshrs-all-v0.12.43-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8f5e124118c721138d0553045eaa5dff9f4864cf0328b79a9e470c403195b3cb"
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
