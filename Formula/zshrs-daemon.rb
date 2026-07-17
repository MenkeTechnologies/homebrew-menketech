class ZshrsDaemon < Formula
  desc "zshrs daemon + zd client only — for users of other shells (bash/fish/zsh)"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs-all", because: "both install zd and zshrs-daemon"
  conflicts_with "zshrs", because: "both install zd"
  version "0.12.17"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.17/zshrs-all-v0.12.17-aarch64-apple-darwin.tar.gz"
      sha256 "89b9e2629d5e694bb566dbbb3b3567931fa92239f203e1e5bf4f2cd2e0a441d1"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.17/zshrs-all-v0.12.17-x86_64-apple-darwin.tar.gz"
      sha256 "57db4dc0733539df70a3b42b87b6a71d90dce97071e454258e6dad7746c5219a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.17/zshrs-all-v0.12.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "27cd92243475118cb8051d9deae4b6881db3fc3e911609f14494bcf78ba87fe2"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.17/zshrs-all-v0.12.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a2b84df296130ac0d1b21de202ee20e7dccc70c5176b835806d8ba6b5ca0fa69"
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
