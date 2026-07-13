class Storageshower < Formula
  desc "Cyberpunk disk-usage TUI in Rust (ratatui + sysinfo, drill-down + theme editor)"
  homepage "https://github.com/MenkeTechnologies/storageshower"
  license "MIT"
  version "0.28.9"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/storageshower/releases/download/v0.28.9/storageshower-v0.28.9-aarch64-apple-darwin.tar.gz"
      sha256 "a4c56d6963c989d0874754a9c8affda2121e446f78f3ca2387a245ec15d8f970"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/storageshower/releases/download/v0.28.9/storageshower-v0.28.9-x86_64-apple-darwin.tar.gz"
      sha256 "4ce55fca69cb7795fdd938ffa04bc05e8cd3d64fcaa2401f475e97ce764f7e46"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/storageshower/releases/download/v0.28.9/storageshower-v0.28.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6e92ae7e212b7d6915e4902e8a13ed8a7d77a5bbe97fa38ce91b42269dbf0cb0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/storageshower/releases/download/v0.28.9/storageshower-v0.28.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "26e015b026d54b9867203b401402b2ef5a90af083f54dbd7b5691031264ae071"
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
  #   storageshower-v0.28.9-x86_64-unknown-linux-musl.tar.gz  sha256: fec8622976563ba4fa0a9a1483bff0d4f0947634c2d996ae30c93145550eca2d
  #   storageshower-v0.28.9-aarch64-unknown-linux-musl.tar.gz  sha256: abc3211998d9fbb376c4e180cbdc4d576c1dd6d3d7452b7df5ee2fbc7fd80118
end
