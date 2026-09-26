class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.55"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.55/stryke-v0.17.55-aarch64-apple-darwin.tar.gz"
      sha256 "18b97afddda873d6e59816ce98b9842e13b7f65b7be90c29e5c58f272600c84c"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.55/stryke-v0.17.55-x86_64-apple-darwin.tar.gz"
      sha256 "163e08ce041d739d5e53ca5ba08dbfeba65de5cb1c65a2375543479ad1faceec"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.55/stryke-v0.17.55-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "597234c256de3707e466936f6bf60a8c3f0a182945a3b715120148673563a501"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.55/stryke-v0.17.55-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2377979d594aa9407dd378dbd56439402035224c2fab562245473ba1938921e3"
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
