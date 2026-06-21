class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.20"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.20/stryke-v0.17.20-aarch64-apple-darwin.tar.gz"
      sha256 "0f57a780eff61c56f0797297e42c98ba854592ec48d618d3568da3dd8093d6c7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.20/stryke-v0.17.20-x86_64-apple-darwin.tar.gz"
      sha256 "4e3b773b10466e0d0629099ff0f6e5112478ce0eb8b75c9470d8b6971dae423f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.20/stryke-v0.17.20-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.20/stryke-v0.17.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b15f2c606823cecfc3c652e992e7e378911c3905d3d0dbd9806c0f3c94eaa819"
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
