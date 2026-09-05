class Storageshower < Formula
  desc "Cyberpunk disk-usage TUI in Rust (ratatui + sysinfo, drill-down + theme editor)"
  homepage "https://github.com/MenkeTechnologies/storageshower"
  license "MIT"
  version "0.28.16"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/storageshower/releases/download/v0.28.16/storageshower-v0.28.16-aarch64-apple-darwin.tar.gz"
      sha256 "7536aa6aa3e7d03ea6e491998cd60cdec643037d2c07d715b53cba8413016577"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/storageshower/releases/download/v0.28.16/storageshower-v0.28.16-x86_64-apple-darwin.tar.gz"
      sha256 "3ba0000c3332edb9f393b20b0c2e29fee6ba966d1ec50eb407be35be2cf1fe37"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/storageshower/releases/download/v0.28.16/storageshower-v0.28.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6777d0899383239f3c9908ad747974223943fb681c29b06c177a2e7c017c7882"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/storageshower/releases/download/v0.28.16/storageshower-v0.28.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bd7cec1e433e721ab65deb911a3833ca4eeec3ce161d15bbeeb74732cc8bf108"
    end
  end

  def install
    bin.install "storageshower"
  end

  test do
    # TUI binary — --version is the contract we test (no interactive launch in CI).
    assert_match version.to_s, shell_output("#{bin}/storageshower --version 2>&1", 0..2)
  end

  # Static musl tarballs also published at this release:
  #   storageshower-v0.28.16-x86_64-unknown-linux-musl.tar.gz  sha256: a72db34a36b9fd1cbe9120f7a6536c27df9a4a27ad86d697ab9ee48dff1161bc
  #   storageshower-v0.28.16-aarch64-unknown-linux-musl.tar.gz  sha256: ca95e1ee87fb498c4a6c5dc497d2b86a0d0400238a5787d04e8dcd2fbd986a8e
end
