class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.16.40"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.40/stryke-v0.16.40-aarch64-apple-darwin.tar.gz"
      sha256 "b4e63c2d47f0c1cc753db3025705fae4c59ad55209fb782ad097fdfa41a8bf36"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.40/stryke-v0.16.40-x86_64-apple-darwin.tar.gz"
      sha256 "7c73355408a2065dd6938c5127ab498111b6d5fdcdbc6402feaebba76137e1e5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.40/stryke-v0.16.40-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.40/stryke-v0.16.40-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0846abe5f25ccd306362badb444237da25e3674ec9892e8a4796f6a9c87e69c3"
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
