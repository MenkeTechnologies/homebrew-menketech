class Lsofrs < Formula
  desc "Rust rewrite of lsof — 5–21× faster, 7-tab TUI, 31 cyberpunk themes"
  homepage "https://github.com/MenkeTechnologies/lsofrs"
  license "MIT"
  version "4.9.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.9.2/lsofrs-v4.9.2-aarch64-apple-darwin.tar.gz"
      sha256 "ae827e86d2fa4c3a8716ae432d1fda934bdcc7c63fcfde3e5d1ece1204a8d81c"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.9.2/lsofrs-v4.9.2-x86_64-apple-darwin.tar.gz"
      sha256 "7df64482e4cf2e1b5ce78971644c8d46d416d9167d11d17c1967dff909acf53b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.9.2/lsofrs-v4.9.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dba5a79989a524f49e81715dd312ba5582f101eb66f58d05a016d4e06eba017d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.9.2/lsofrs-v4.9.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f6d51e5a5617ada03148c7e53cee04244b92351110cbc8dac3de46a53b1c372f"
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
  #   lsofrs-v4.9.2-x86_64-unknown-linux-musl.tar.gz  sha256: 806b6852e8e94e0ea9079fccdbee080e611fd690a97d4c385dc20e9f4e2c0027
  #   lsofrs-v4.9.2-aarch64-unknown-linux-musl.tar.gz  sha256: 1690dbbfa2ed3ed3a2c1f4aabb9b526107c667dbcac644432f95b543db66698b
end
