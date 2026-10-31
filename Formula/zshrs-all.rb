class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.58"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.58/zshrs-all-v0.13.58-aarch64-apple-darwin.tar.gz"
      sha256 "a64495565b6447770eb5c90a78c757505d7ced4b4cc1326d152b35d60d98cee7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.58/zshrs-all-v0.13.58-x86_64-apple-darwin.tar.gz"
      sha256 "1ad5f423b6876642ff4c16ee06a34d338b617a6b3381ee6842dded88e9f38d05"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.58/zshrs-all-v0.13.58-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f1830b7c3345fbd784a8237219bd47a9baf12d034011333dc5631298ef0c3649"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.58/zshrs-all-v0.13.58-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7c56fb3b1e4f0453a8a849c8b4e641ffac5236a6f662ae5aac27a76a74ff7e17"
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

  # Static musl tarballs also published at this release:
  #   zshrs-all-v0.13.58-x86_64-unknown-linux-musl.tar.gz  sha256: 5a9d7526e103a07981ba5bc63c5c1eac371b343ce79e6fe47fe4efba3e85e267
end
