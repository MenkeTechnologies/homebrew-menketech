class Awkrs < Formula
  desc "AWK in Rust — bytecode VM + Cranelift JIT + persistent rkyv bytecode cache"
  homepage "https://github.com/MenkeTechnologies/awkrs"
  license "MIT"
  version "0.4.10"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.10/awkrs-v0.4.10-aarch64-apple-darwin.tar.gz"
    sha256 "ffe65106d2808972b67650513ab021fb665bcc373dacbdb521b0d8de0d7c10aa"
  end
  # x86_64 macOS not supported — see release.yml matrix.
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/awkrs/releases/download/v0.4.10/awkrs-v0.4.10-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "88b2b6dcae1f23af953dc71ab8882785df24425d53c1a121ff507fa3dd83eeeb"
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
