class ZshrsDaemon < Formula
  desc "zshrs daemon + zd client only — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.10"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.10/zshrs-all-v0.12.10-aarch64-apple-darwin.tar.gz"
      sha256 "9d397c6fe7d1563e3d832ff58fd1fae26af3da7025702d5740562c0c2a130d74"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.10/zshrs-all-v0.12.10-x86_64-apple-darwin.tar.gz"
      sha256 "2fe4fce52e78d8a3784bb24ecb7fa7f46d12c526025608a2f5f828101c30c9fb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.10/zshrs-all-v0.12.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a00bc7840f974bbdc6fb33e089675926271a2fabe1c1e13bd1ea8d237039fa11"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.10/zshrs-all-v0.12.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fe2ccd54e4fb74e0783b9dabe1e0360e9fb1dade51acee0babe5794fbe713615"
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
