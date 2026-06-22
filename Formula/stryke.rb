class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.22"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.22/stryke-v0.17.22-aarch64-apple-darwin.tar.gz"
      sha256 "8c85bcf3c57c3c918b5f9a8a161710923a4887765d16f7bf576fe61749b4393d"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.22/stryke-v0.17.22-x86_64-apple-darwin.tar.gz"
      sha256 "5851f3d7f3ef65d3bf9c3e9cfd6ceddf24c06ecdf17db891005df1907b86127a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.22/stryke-v0.17.22-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.22/stryke-v0.17.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "79418b0747d4f26f1a1a2cf5d18cb254c0469686279ddfd662896f3a3f198c18"
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
