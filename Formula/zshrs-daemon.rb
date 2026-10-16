class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.46"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.46/zshrs-all-v0.13.46-aarch64-apple-darwin.tar.gz"
      sha256 "668bad7371f7d08cf01addaa0d8b85630e4761577de2eee88e19b195788e17d2"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.46/zshrs-all-v0.13.46-x86_64-apple-darwin.tar.gz"
      sha256 "1b9a79e7f7180a051da4bf9060f114148859cc42302353475b4015bd0f654f08"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.46/zshrs-all-v0.13.46-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "67778cdce5e24394d96b69656fcaf91ddad01cdbe154fddac0dd78107a2fb615"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.46/zshrs-all-v0.13.46-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e374e379124bc27f0ba4133d870417c7fc1935dd3088c2a157aa88ff70cd8aa7"
    end
  end

  def install
    bin.install "zshrs-daemon"
    bin.install "zd"
  end

  test do
    assert_match "zshrs-daemon #{version}", shell_output("#{bin}/zshrs-daemon --version")
    assert_match "zd #{version}", shell_output("#{bin}/zd --version")
  end
end
