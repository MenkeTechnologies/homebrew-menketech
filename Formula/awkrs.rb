class Awkrs < Formula
  desc "AWK in Rust — bytecode VM + Cranelift JIT + persistent rkyv bytecode cache"
  homepage "https://github.com/MenkeTechnologies/awkrs"
  license "MIT"
  version "0.4.8"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.8/awkrs-v0.4.8-aarch64-apple-darwin.tar.gz"
    sha256 "0e4988434e1b4826993d5ca941b137844f6728a07db49bd94c4741a95c9818c7"
  end
  # x86_64 macOS not supported — see release.yml matrix.
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.8/awkrs-v0.4.8-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d99d97508254b5ecc7aca941e668831bd0517e8c7830792b14e2496b6741f920"
  end
  end

  def install
  bin.install "awkrs"
  bin.install "aw"
  end

  test do
    assert_match "hi", shell_output("echo hi | #{bin}/awkrs \'{print}\'").strip
  end
end
