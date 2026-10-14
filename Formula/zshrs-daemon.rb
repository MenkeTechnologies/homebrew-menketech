class ZshrsDaemon < Formula
  desc "Daemon and zd client from zshrs — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.13.43"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.43/zshrs-all-v0.13.43-aarch64-apple-darwin.tar.gz"
      sha256 "cd18b604c1a5c7836fc9f23888837feee709bf05c0130819b16e7a7899b1f359"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.43/zshrs-all-v0.13.43-x86_64-apple-darwin.tar.gz"
      sha256 "d71bd760e73b78a9f8cad80658c7ae9ce86e8575ddf345ba77ee6f938981725e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.43/zshrs-all-v0.13.43-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d73e232b67535c867383f839698888abde4065b7820c25323a6591f2e158c6c4"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.43/zshrs-all-v0.13.43-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8e5787c90a152f50bff1dc8cc80b4859e586497506bfcf072046330e0ec1e1ea"
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
