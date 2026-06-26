class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.30"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.30/stryke-v0.17.30-aarch64-apple-darwin.tar.gz"
      sha256 "326f2334775fb3019cd446c298970d0139742fa6346d2fd498b83408e6b802c9"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.30/stryke-v0.17.30-x86_64-apple-darwin.tar.gz"
      sha256 "14ee9c001992cd3144ddc2a066d1f652a151afe3c562c966cd98791fb7b76010"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.30/stryke-v0.17.30-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3a3138e7e507f470d536c7be207e64bd686e011a353f4f61667d06d352cfacfc"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.30/stryke-v0.17.30-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d22fc079537200c62c6bb169cfc0ff9c6a8a9b27a8f0253199f7070b25505b63"
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
