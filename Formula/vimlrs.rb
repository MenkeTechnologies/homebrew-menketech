class Vimlrs < Formula
  desc "Vimscript (VimL) interpreter in Rust, ported from Neovim's C eval engine"
  homepage "https://github.com/MenkeTechnologies/vimlrs"
  license "MIT"
  version "0.2.4"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.4/vimlrs-v0.2.4-aarch64-apple-darwin.tar.gz"
      sha256 "f2c9364bb75941a1d9e62d278ba09b529196f8ddf61a0c01cb5d74aaee19a5fa"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.4/vimlrs-v0.2.4-x86_64-apple-darwin.tar.gz"
      sha256 "c1e9b009d4ea9d28ae55f797fe761786087e5984a9f50ced8e765c9349e4bb2c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.4/vimlrs-v0.2.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bd73f446262e685f13946332093bb3e0147e36eff05d025cf135257dc49579fb"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/vimlrs/releases/download/v0.2.4/vimlrs-v0.2.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ec320ffbfa28ea8fb292123d6f402ab1f4f8382af02098426fa3695e15a731fb"
    end
  end

  def install
    bin.install "viml"
  end

  test do
    assert_match "viml", shell_output("#{bin}/viml --version")
  end

  # Static musl tarballs also published at this release:
  #   vimlrs-v0.2.4-x86_64-unknown-linux-musl.tar.gz  sha256: ec78f1c9da559a9b5829cf55d0cf66493a9eea833315bd66b2b700c7b41de029
  #   vimlrs-v0.2.4-aarch64-unknown-linux-musl.tar.gz  sha256: c8dc14d5055ce8c3e039b769145fc9060092acef5b30d0c1151a00aabaab5adf
end
