class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.16.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.3/stryke-v0.16.3-aarch64-apple-darwin.tar.gz"
      sha256 "783027f05cb8dc5dd9a3d37fa65f4cb04744dea983f87b73e1c5b590ba652369"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.3/stryke-v0.16.3-x86_64-apple-darwin.tar.gz"
      sha256 "6758ab4c0064456ea31219087bc81a83a9c814a999132daf51a9fc4d1c5fe45e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.3/stryke-v0.16.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.3/stryke-v0.16.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "40e7fa632f6bb2931ff3ed3bf14ce3ee6fbb8eafde6436ecf59f7124e4e32643"
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
