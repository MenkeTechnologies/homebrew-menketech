class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.62"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.62/stryke-v0.17.62-aarch64-apple-darwin.tar.gz"
      sha256 "e8a2c87dcb054bb94a703f6bd05c80202aab694a6b2e37691a1e33645d90f6ae"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.62/stryke-v0.17.62-x86_64-apple-darwin.tar.gz"
      sha256 "802a11f9cc5ca92e2b8577c11e4ac262bae8d35c2135833f1698779dcf048720"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.62/stryke-v0.17.62-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "401ce9d07b26a337c243458d94e48e3deb29660d1ef3c02827e51bdced650ee0"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.62/stryke-v0.17.62-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f0a89c832aba2093dce390d2e44be5e4466a43df684387a4d699e774e6464fbb"
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
