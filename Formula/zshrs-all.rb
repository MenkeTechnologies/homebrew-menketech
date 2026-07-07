class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.8"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.8/zshrs-all-v0.12.8-aarch64-apple-darwin.tar.gz"
      sha256 "7ad523e827c9a4b711b177e84e5646498f7cf732d081756b3e48e1dc18ddede2"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.8/zshrs-all-v0.12.8-x86_64-apple-darwin.tar.gz"
      sha256 "9530f27b40090eea4c668408bf234bb909b998da6de0c0b7cac1d67dccf4725b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.8/zshrs-all-v0.12.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "09cf0db73b7246f7301736029e33148c7ef31751f4f3ce604c5e5cea512a61a2"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.8/zshrs-all-v0.12.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "be3f27c05bc8c302c3102b16311c73879ff856ce36162f77828cb0a0dfc6b5b6"
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
