class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.12"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.12/stryke-v0.17.12-aarch64-apple-darwin.tar.gz"
      sha256 "b16547b3e7e550ad074e63009f300aabb75ac1d45fd2cc4a5074658f44eb7f9b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.12/stryke-v0.17.12-x86_64-apple-darwin.tar.gz"
      sha256 "2d1befdb143c49577d7d8c69a4924ee17974dc3752d24cfbb173df1866815844"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.12/stryke-v0.17.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.12/stryke-v0.17.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4c038a235508f2211fe8ad330806b01ba35f35c75041c67f9a3585b620be2bee"
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
