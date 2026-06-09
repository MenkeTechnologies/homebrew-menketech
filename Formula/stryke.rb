class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.16.39"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.39/stryke-v0.16.39-aarch64-apple-darwin.tar.gz"
      sha256 "bdee8a0ae7ddd68c6eb3c52169995c3a0929c17da0ec4741e6f1de115ac45f02"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.39/stryke-v0.16.39-x86_64-apple-darwin.tar.gz"
      sha256 "239f457e7a09940c7e98db7d8ccd05ac8ff7a561bbcf9f9b46511b853e602d31"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.39/stryke-v0.16.39-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.39/stryke-v0.16.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f1e21cac82ce191b8b3132b70fa6a2f667317d84f7c65f68c44bb68fd975b771"
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
