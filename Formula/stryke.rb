class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.16.23"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.23/stryke-v0.16.23-aarch64-apple-darwin.tar.gz"
      sha256 "01a56f345afab1dde2374fb75f37715d55046d838fb16edde9f9726b6f8aaa47"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.23/stryke-v0.16.23-x86_64-apple-darwin.tar.gz"
      sha256 "bd69e1e3309c4bce9adecbdb4690906bcae632782a37b2ad02482c684caf54b9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.23/stryke-v0.16.23-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.23/stryke-v0.16.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "37802d39bdd476e87d6210e21e895915c102104319b9d97129546e5fa424e561"
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
