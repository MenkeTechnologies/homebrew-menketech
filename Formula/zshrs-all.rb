class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.4"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.4/zshrs-all-v0.12.4-aarch64-apple-darwin.tar.gz"
      sha256 "ff24e5ea92ca9d56f33191c38dcc517e51fe772b8f2389b4916e6473037e7617"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.4/zshrs-all-v0.12.4-x86_64-apple-darwin.tar.gz"
      sha256 "0e30fdfe4840c81ed15312ab5af626bc32c9f67c60b8889c8b201a8ef51d22c1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.4/zshrs-all-v0.12.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6bffc091b8a23d034cebdb65352eaef9a0a645bd262dc76b9c7f2b3f30acad90"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.4/zshrs-all-v0.12.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "320affe0fc5a4442420c6b5bcefd3d70be968daf09fde2739b6c5bb6cd1b865a"
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
