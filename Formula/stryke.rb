class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.16.45"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.45/stryke-v0.16.45-aarch64-apple-darwin.tar.gz"
      sha256 "5d93f42edfa36e798fb487eecd93bd86830f5faec009907974c0f25d601abc96"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.45/stryke-v0.16.45-x86_64-apple-darwin.tar.gz"
      sha256 "293300c1b4dc9650bc9d1c6b68423d3fc676deadf0df1dce05c4ba601d1bc8e8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.45/stryke-v0.16.45-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.45/stryke-v0.16.45-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "66f35c156a126c5742f24723f38ca88e629a049ab9ddd093b42f19e133d16a71"
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
