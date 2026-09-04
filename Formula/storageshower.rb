class Storageshower < Formula
  desc "Cyberpunk disk-usage TUI in Rust (ratatui + sysinfo, drill-down + theme editor)"
  homepage "https://github.com/MenkeTechnologies/storageshower"
  license "MIT"
  version "0.28.15"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/storageshower/releases/download/v0.28.15/storageshower-v0.28.15-aarch64-apple-darwin.tar.gz"
      sha256 "bd84877a2930fc12f9e31e524358a5c268bd49ed0de16c40f9dea8767d7c26e6"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/storageshower/releases/download/v0.28.15/storageshower-v0.28.15-x86_64-apple-darwin.tar.gz"
      sha256 "9b414dd306f12570a7579e309ad6e48bc49dab832073e96c4e8d375d95223653"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/storageshower/releases/download/v0.28.15/storageshower-v0.28.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "30bb089752e8d1b67904791cc6b8dbd926f3371fa7f55605f36eacc81917c1da"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/storageshower/releases/download/v0.28.15/storageshower-v0.28.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f64fb435702d5407aa36c5fb22aedba45142f96950162228c5a0f856e784c0bd"
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
  #   storageshower-v0.28.15-x86_64-unknown-linux-musl.tar.gz  sha256: 20e4af78fe6ebe4ecf9138a196b845df4afc6da6ff17e7368e4fb9607d78b6d4
  #   storageshower-v0.28.15-aarch64-unknown-linux-musl.tar.gz  sha256: a618ef8d0fcff0f2ac28091849082f512271f3798dade5e640e31be408ed4ca5
end
