class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.16.44"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.44/stryke-v0.16.44-aarch64-apple-darwin.tar.gz"
      sha256 "1683f0c16a65c9438de55d0949d45c5d9d36c64f59e2d1d9435b14edff938cb0"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.44/stryke-v0.16.44-x86_64-apple-darwin.tar.gz"
      sha256 "bbdc62901fc2fd270c01bb21067bbdc12f000099f7dfcc88850f638b4edc2781"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.44/stryke-v0.16.44-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.44/stryke-v0.16.44-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "78f0d7775159e9dd3d062963eba9142eb92a49a9296fa5e5e9754338ba2dfdaf"
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
