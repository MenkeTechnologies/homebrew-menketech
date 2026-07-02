class Lsofrs < Formula
  desc "Rust rewrite of lsof — 5–21× faster, 7-tab TUI, 31 cyberpunk themes"
  homepage "https://github.com/MenkeTechnologies/lsofrs"
  license "MIT"
  version "4.9.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.9.0/lsofrs-v4.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "89eef74d21fe11beeb5271ae7fac5a7bcdda091402a954ae076dfcdedd620b3f"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.9.0/lsofrs-v4.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "8ee914a60b52881fa604948dffd1f1d823b09cf53859f4576d7aa43b5304016f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.9.0/lsofrs-v4.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "20247e96f49b0459da9eff8c3fc2d52e351a07390c24be034675c37ee614b516"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/lsofrs/releases/download/v4.9.0/lsofrs-v4.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4b784633f6b6de61281d5b75b9f5a4d4b0e071ae76c549bbc25fdd4655eda0bd"
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
  #   lsofrs-v4.9.0-x86_64-unknown-linux-musl.tar.gz  sha256: 619cca7f14754cddb50fc46a2165c7c54b06eb1498ba79e130db3d357adcec15
  #   lsofrs-v4.9.0-aarch64-unknown-linux-musl.tar.gz  sha256: 01fab6af05e873014be9b83e01e3f6660ca5da1ce059abe5d09a8f5b8a8b018f
end
