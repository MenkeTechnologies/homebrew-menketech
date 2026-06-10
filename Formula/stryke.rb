class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.4"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.4/stryke-v0.17.4-aarch64-apple-darwin.tar.gz"
      sha256 "95d1a131b817b44857e1e8222780705f50c4aab11ea75fca65d4fe9b1be1cacb"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.4/stryke-v0.17.4-x86_64-apple-darwin.tar.gz"
      sha256 "9224f594d027f28336f1496558fee75037b7c8dc5313ce7e93192263c5009b45"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.4/stryke-v0.17.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.4/stryke-v0.17.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dc0c087f9a42f22ae59f82cf52358bdd9ed7268b1ab55b7e9d242c8e1cdb021d"
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
