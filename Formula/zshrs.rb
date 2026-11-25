class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.82"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.82/zshrs-v0.13.82-aarch64-apple-darwin.tar.gz"
      sha256 "1330eb9759dcce71f26bdb5f7e1285cee51b05bc076078e88d99bcfb036c2e7b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.82/zshrs-v0.13.82-x86_64-apple-darwin.tar.gz"
      sha256 "fd8ec8034bf0659daa48ce874dbd684a25b5d592590ceecd25951bb93462e193"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.82/zshrs-v0.13.82-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1023de123c625fb241cebc541a1ab8e9f014d8b64d577d51824a79645c74e329"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.82/zshrs-v0.13.82-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c231522b5c0589381617a625888abc220bfe137cd9e516116db7dc997d4a9d04"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-v0.13.82-x86_64-unknown-linux-musl.tar.gz  sha256: cfc3b509c38e583b30be210633a9bb8c4c21429d31cee2992bd76fe9175e2cbd
  #   zshrs-v0.13.82-aarch64-unknown-linux-musl.tar.gz  sha256: a4fff45973cc8413d164463da3613a1106dd6850d1dde8edf4095a63ad8ea6ca
end
