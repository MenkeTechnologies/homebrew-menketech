class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.12.57"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.57/zshrs-all-v0.12.57-aarch64-apple-darwin.tar.gz"
      sha256 "7f84dbf9e784681c09b4199ef609871e09ab31106b183779f01fa6ea9ab482b7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.57/zshrs-all-v0.12.57-x86_64-apple-darwin.tar.gz"
      sha256 "bfd3354c79479f68b3e13bce4e320ed7b7677d0efa7b4a488cff8de5d7922740"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.57/zshrs-all-v0.12.57-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a284cbc0db302e128cf919d45d56ef14e2ef910eab7a79f4f1cc75bfc5466c3f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.57/zshrs-all-v0.12.57-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "42ef99b958ca2de2a1b95ad4679fa0cea768db183ce191f9cabb29745f39f8c8"
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
  #   zshrs-all-v0.12.57-x86_64-unknown-linux-musl.tar.gz  sha256: 81247e1d79c3b9026502c9572abad39a469ffea7dd312b2e2d30138fd7069d88
  #   zshrs-all-v0.12.57-aarch64-unknown-linux-musl.tar.gz  sha256: 997267652d1d7d6b5bade1acbbc16362dfd96f78a6e08c8069920706ec48acf6
end
