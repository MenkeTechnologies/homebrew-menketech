class Storageshower < Formula
  desc "Cyberpunk disk-usage TUI in Rust (ratatui + sysinfo, drill-down + theme editor)"
  homepage "https://github.com/MenkeTechnologies/storageshower"
  license "MIT"
  version "0.28.8"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/storageshower/releases/download/v0.28.8/storageshower-v0.28.8-aarch64-apple-darwin.tar.gz"
      sha256 "8263410a789db95bae484039e2eddc4248216f0dced81c4e57346244915ac73d"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/storageshower/releases/download/v0.28.8/storageshower-v0.28.8-x86_64-apple-darwin.tar.gz"
      sha256 "517f328a0f0485e02d82041daef254b13c555dbc66a9475deb28632cb475434f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/storageshower/releases/download/v0.28.8/storageshower-v0.28.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "386f8119846ca38fd0db6cf38d5e9ecfedbc7a4e1432fb3713976e9d0e625064"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/storageshower/releases/download/v0.28.8/storageshower-v0.28.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "04d18f588e4a5d409ac92b0f3b521768e14bc8893889f3467522458c133a624a"
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
  #   storageshower-v0.28.8-x86_64-unknown-linux-musl.tar.gz  sha256: 9eeea7a61f6a56f26cbaa7c72b00495f8e4b9e7eb7e378617298e4646e0d9b49
  #   storageshower-v0.28.8-aarch64-unknown-linux-musl.tar.gz  sha256: 8ce8c38fff284d0653e1d672e5e8a4316bfb15ab4b24afadd3217cfd598c8a9c
end
