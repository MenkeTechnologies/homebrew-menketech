class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.60"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.60/stryke-v0.17.60-aarch64-apple-darwin.tar.gz"
      sha256 "3970302dc6bfe83f8cead4d2eb90afd77dd2b6b57315342362fac5c9ec082893"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.60/stryke-v0.17.60-x86_64-apple-darwin.tar.gz"
      sha256 "761e205c9c48eccedd64846cc063dc81d89d304c91502cf9a975b3c5440c292f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.60/stryke-v0.17.60-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "08dea402b200182237b2e2df05ca98025926d2120ed92dcb1424df4b7c9dd5bb"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.60/stryke-v0.17.60-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f2b882590c9f3f10d7e57972429fe87a08bad1da9c77aac66695ba0944f2a04e"
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
