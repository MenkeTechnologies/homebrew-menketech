class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.41"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.41/zshrs-all-v0.13.41-aarch64-apple-darwin.tar.gz"
      sha256 "278de7fcc3991768e0f26b1d54714d30ba5344ddd21711ec7b9067f2bb0c67aa"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.41/zshrs-all-v0.13.41-x86_64-apple-darwin.tar.gz"
      sha256 "fbc083d7483a10d86131579d8178a30439664cde1377f6d3fc26705ff0efd7d7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.41/zshrs-all-v0.13.41-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3362a0eef018bc8eec66f3d0eeb00c2cdd1eb54f32ebf07193f7950cc643b4ed"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.41/zshrs-all-v0.13.41-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "03c36cb916db3c67052593269cd72a399bfeb6f6ed62437d2bae443db623d735"
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
