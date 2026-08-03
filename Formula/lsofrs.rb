class Lsofrs < Formula
  desc "Rust rewrite of lsof — 5–21× faster, 7-tab TUI, 31 cyberpunk themes"
  homepage "https://github.com/MenkeTechnologies/lsofrs"
  license "MIT"
  version "4.9.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.9.3/lsofrs-v4.9.3-aarch64-apple-darwin.tar.gz"
      sha256 "13bf989dfa43c6ba964a3bd18c973a3ba696624ed437ff412c8b3c8bb8f1e250"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.9.3/lsofrs-v4.9.3-x86_64-apple-darwin.tar.gz"
      sha256 "c3c2d665b39f8754b11cb006d9618c73b40ee4ebd1f75ca70e50bc7124ea81c2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.9.3/lsofrs-v4.9.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "59f8d8087d8049463976b5d90333e29894858e2c797d9545f437d05e50bf42f8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.9.3/lsofrs-v4.9.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b24b99032b03a2b1d1c75ac46385af142d52e1dbf2d972b60ded758c350457cf"
    end
  end

  def install
    bin.install "lsofrs"
    bin.install "lsf"
  end

  test do
    assert_match "lsofrs", shell_output("#{bin}/lsf --version")
  end

  # Static musl tarballs also published at this release:
  #   lsofrs-v4.9.3-x86_64-unknown-linux-musl.tar.gz  sha256: 71eb16273658d5d51d0ac114d4a895eb5882e03e9edf8fa5689792515b29b08e
  #   lsofrs-v4.9.3-aarch64-unknown-linux-musl.tar.gz  sha256: 57ae37a1547cbd918393da2474da4bfa8d30efb98d9b92dac4af2c7edc19fbcf
end
