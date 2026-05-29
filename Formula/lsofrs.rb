class Lsofrs < Formula
  desc "Rust rewrite of lsof — 5–21× faster, 7-tab TUI, 31 cyberpunk themes"
  homepage "https://github.com/MenkeTechnologies/lsofrs"
  license "MIT"
  version "4.8.3"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.8.3/lsofrs-v4.8.3-aarch64-apple-darwin.tar.gz"
    sha256 "d92d29aae59016b1e5b34331209dae2d380975fd944e5e30f25bd9716cdf67c3"
  end
  on_intel do
    url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.8.3/lsofrs-v4.8.3-x86_64-apple-darwin.tar.gz"
    sha256 "f939d6f5acee6b4d6a1ee9e9c4a625c608c57b213dc6bd66b93d16f1dbda63c3"
  end
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.8.3/lsofrs-v4.8.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1b5bffa5b8aab04a0daf45899324a64ee72607306677f3533168d54b6cce3735"
  end
  end

  def install
  bin.install "lsofrs"
  bin.install "lsf"
  end

  test do
    assert_match "lsofrs", shell_output("#{bin}/lsf --version")
  end
end
