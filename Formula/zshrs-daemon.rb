class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.35"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.35/zshrs-all-v0.13.35-aarch64-apple-darwin.tar.gz"
      sha256 "daee7c4e96345d4fdd7695bf65ce1ee63f798093d30d92d065a6adfda4cbadf2"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.35/zshrs-all-v0.13.35-x86_64-apple-darwin.tar.gz"
      sha256 "2fd73c72b2f178360d872e1e6f02565732d4e7395d336e12e03d7a3164a7855c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.35/zshrs-all-v0.13.35-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "487a4e6d50285fc5afa924b9cfd604d108a9c25b2cdca8d337adfee5216fe664"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.35/zshrs-all-v0.13.35-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c44c8b3233f7ae91755b1b7d4299850058eae8bc790e812d40b23b22f745a8ef"
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
