class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.78"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.78/zshrs-all-v0.13.78-aarch64-apple-darwin.tar.gz"
      sha256 "0cdabd1d5778c07f3be01c5485473fbe6c4ab904fc353f4eb98e66f14f9a763e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.78/zshrs-all-v0.13.78-x86_64-apple-darwin.tar.gz"
      sha256 "445d9f0a452eea6a18fd687c4fc2f005fdb08cca02957c1478b441aa3878d584"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.78/zshrs-all-v0.13.78-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eba17d220541948e086007c4f26482dfab6b212ada3e5981731f94f40a337176"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.78/zshrs-all-v0.13.78-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5ec4b37ae66ba8afe7c88eb3d1352b4c1c8826933c255fe4ff720adcc3358890"
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
  #   zshrs-all-v0.13.78-x86_64-unknown-linux-musl.tar.gz  sha256: 9263826a8027c85454c7f869ef2385a757a241174bdfdb91d53c97cd942e34de
end
