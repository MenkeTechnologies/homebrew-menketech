class ZshrsDaemon < Formula
  desc "zshrs daemon + zd client only — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.21"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.21/zshrs-all-v0.12.21-aarch64-apple-darwin.tar.gz"
      sha256 "4c10fc5f9a2698bd1ec44b595beccebfedb8d4c502b61718dd479e89b378df0e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.21/zshrs-all-v0.12.21-x86_64-apple-darwin.tar.gz"
      sha256 "60d81b2c943e30df91dc1da8ea556f15ff7310a4ff74fbd9a5eabad34c8928aa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.21/zshrs-all-v0.12.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f9b9676a2c23acced9e5134a54c0fd8f3fc36c5304c37a0e8c73af521810ae8b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.21/zshrs-all-v0.12.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aac8726db6b0f660f38a31afdc9f7ccf58e28a818b76074662e5fbc8abf71f40"
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
