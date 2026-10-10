class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.23"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.23/zshrs-all-v0.13.23-aarch64-apple-darwin.tar.gz"
      sha256 "7c06283ab1eef773afa01f10cd1865b9d1364cfd9b8c3b44258641e89da17ea3"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.23/zshrs-all-v0.13.23-x86_64-apple-darwin.tar.gz"
      sha256 "673a92f2848d0834aff616e0f39a985c87081bb6db59ef039ceb8289260ccede"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.23/zshrs-all-v0.13.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7eab1f4155a1b8332c04abbae9f50bd370fac5daa94595a8a168507431c56826"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.23/zshrs-all-v0.13.23-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f199b2f647cc61dc2878940f3cb98916bba15c47170c7e87ace3489ca4c2e69e"
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
