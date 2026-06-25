class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.28"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.28/stryke-v0.17.28-aarch64-apple-darwin.tar.gz"
      sha256 "99687ee7f34e5ecf20926e12d1d287882ca32710260f3f51c5069491f90b0646"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.28/stryke-v0.17.28-x86_64-apple-darwin.tar.gz"
      sha256 "47ed9c0a3830049bdf95de5a6da938fe4261f3d200768b110125ac54b325c383"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.28/stryke-v0.17.28-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.28/stryke-v0.17.28-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4d27615c389e9ef88e64b4cfbb8a0d17af44a3fc3f7695f80954fcffa8438dec"
    end
  end

  def install
    bin.install "stryke"
    bin.install "st"
    bin.install "s"
  end

  test do
    assert_match "hello", shell_output("#{bin}/s -e 'print \"hello\"'")
  end
end
