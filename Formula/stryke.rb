class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.17.21"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.21/stryke-v0.17.21-aarch64-apple-darwin.tar.gz"
      sha256 "5b93465b0fa7236f80d68df72ad10aa325be02c813b306e554705e310e62081e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.21/stryke-v0.17.21-x86_64-apple-darwin.tar.gz"
      sha256 "7394f0fb9daca1c4eb4fa1a325d4befe34f1e1a9b058afa61354a7befb8b680f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.21/stryke-v0.17.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.17.21/stryke-v0.17.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ee6606faa8e0e1252e90e440f4eb2c5f128f090243db73f1c617a515fe890b22"
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
