class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.17"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.17/zshrs-all-v0.13.17-aarch64-apple-darwin.tar.gz"
      sha256 "f851680a2ab5a8c8f9fe858f9c80ae51e9b41548b82e23c470cd25a64c775325"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.17/zshrs-all-v0.13.17-x86_64-apple-darwin.tar.gz"
      sha256 "25a861b6adab9c4ee2d134e4b4f6b898abd21e6f03566417d7f78e70cbcb0ce6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.17/zshrs-all-v0.13.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "de92649c8763e498f5d356ae030927065782f453b6cb5b474419aaa39f4e22ca"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.17/zshrs-all-v0.13.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b33785397696d9f7bf52f8780e7caab8e13ea88a60a56e237b9ce0b278e5b5f2"
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
  #   zshrs-all-v0.13.17-x86_64-unknown-linux-musl.tar.gz  sha256: ca64fbad2508efc89a9fd678c0a260a6245940a4b851d5c04e2cb30752698bb4
  #   zshrs-all-v0.13.17-aarch64-unknown-linux-musl.tar.gz  sha256: e6c37363581cb1e416039bcdd8cc27b67c29f79b04b17d91e22a7e678506584a
end
