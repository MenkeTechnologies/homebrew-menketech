class Awkrs < Formula
  desc "AWK in Rust — bytecode VM + Cranelift JIT + persistent rkyv bytecode cache"
  homepage "https://github.com/MenkeTechnologies/awkrs"
  license "MIT"
  version "0.4.9"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.9/awkrs-v0.4.9-aarch64-apple-darwin.tar.gz"
    sha256 "927353b6cf210af2a34e2decdc205d840952c21f93640fa3d01d73af97ad6512"
  end
  # x86_64 macOS not supported — see release.yml matrix.
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.9/awkrs-v0.4.9-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "79977dcbc49a17181c92f44da67d7b175a697bc3f76a73ddf2aee496a9e6f875"
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
