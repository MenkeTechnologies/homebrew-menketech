class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.16.46"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.46/stryke-v0.16.46-aarch64-apple-darwin.tar.gz"
      sha256 "03d657cc11793baf92853d1e7081e29ddd3496144118330feac5612376f4ba4d"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.46/stryke-v0.16.46-x86_64-apple-darwin.tar.gz"
      sha256 "d942b8db0bcb7231dfbc71135f809a6f0d0a1f3da3e2bc6c01bc25ee4629534f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.46/stryke-v0.16.46-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.46/stryke-v0.16.46-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3b712822cfb78a8df6b806b3c7f51fa02ec3b04b3af8e3d136091f2a6cfaaa11"
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
