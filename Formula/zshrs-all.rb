class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.61"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.61/zshrs-all-v0.13.61-aarch64-apple-darwin.tar.gz"
      sha256 "1362fb3c88b3bc6dd6c02622fb79372cc7a56664582ca39feff949b89cfd7dd2"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.61/zshrs-all-v0.13.61-x86_64-apple-darwin.tar.gz"
      sha256 "0ffd21a3d904d1d67fa9ea158987a988ed7337f7b4f801c9c3c3f65df0510454"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.61/zshrs-all-v0.13.61-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a82b7c377407c9b03352ea20642c702a2b998e549778612fe6ada956ad073140"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.61/zshrs-all-v0.13.61-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6d9c60f192d18da7c55e05f09f3e6d2861f397baf3b77464ad1eb640636ae7b9"
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
  #   zshrs-all-v0.13.61-x86_64-unknown-linux-musl.tar.gz  sha256: 0ad8c9eb8d286b6ee1f60b0ec5433068992a607ad56c647a12f4b62e7d51272f
end
