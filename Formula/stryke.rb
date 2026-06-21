class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.19"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.19/stryke-v0.17.19-aarch64-apple-darwin.tar.gz"
      sha256 "7f8720f7842ce363aaf6d777b76c588f9c86622dc1e90fbda797b00b388b7da1"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.19/stryke-v0.17.19-x86_64-apple-darwin.tar.gz"
      sha256 "9107ab8465617e65aadc598ae6676aa666e7a2a1262a1defa0c630d9c642b89b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.19/stryke-v0.17.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.19/stryke-v0.17.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4332befcce085db5dd337eb37a562568b946a984bf1048b36f7124126b5c34df"
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
