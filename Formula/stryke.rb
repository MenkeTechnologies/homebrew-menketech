class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.16.41"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.41/stryke-v0.16.41-aarch64-apple-darwin.tar.gz"
      sha256 "c2f2dfcb9deffdb6aa3b016afbd84efe67f0c8a1ef682d0855f31e4928e5a11e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.41/stryke-v0.16.41-x86_64-apple-darwin.tar.gz"
      sha256 "9403f71ff9cbce48100bc182a77c20ecbfa71f9960f340f98e485c7519658c15"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.41/stryke-v0.16.41-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.41/stryke-v0.16.41-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e3e9a92157db77fbfc191e9365195fef3fe6a788ae35b2269571543fb7e42c1"
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
