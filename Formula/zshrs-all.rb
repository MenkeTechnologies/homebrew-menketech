class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.59"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.59/zshrs-all-v0.12.59-aarch64-apple-darwin.tar.gz"
      sha256 "65aa9caf4391e6b8f6e45f57efa82cfb34ce6adb6799550e04af1b6f0c7e13a2"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.59/zshrs-all-v0.12.59-x86_64-apple-darwin.tar.gz"
      sha256 "093cbef6557fd688e95ee6522b5c7bbfef3ce4204963f17eb88f82033cb55317"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.59/zshrs-all-v0.12.59-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1b542430ada48d497d328965937c8bf9d0973cef8e52d3be8b79e1996dfa9e52"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.59/zshrs-all-v0.12.59-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dc707e69b9a90f7bf022f2455d80b847f1cf6df39e5f7bc84b39f22546d198af"
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
  #   zshrs-all-v0.12.59-x86_64-unknown-linux-musl.tar.gz  sha256: b38b5adf36263e4a5a8678a6857d04ba62bd520c5a8c5b9431d021879bab4741
  #   zshrs-all-v0.12.59-aarch64-unknown-linux-musl.tar.gz  sha256: 556eb8b957d41af553c1481fc54fdeff7440f6de3e37ba754520988e900b62f7
end
