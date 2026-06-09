class Stryke < Formula
  desc "The 2nd fastest dynamic language — parallel Perl 5 interpreter in Rust"
  homepage "https://github.com/MenkeTechnologies/strykelang"
  license "MIT"
  version "0.16.37"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.37/stryke-v0.16.37-aarch64-apple-darwin.tar.gz"
      sha256 "24ce005c75ddd14a356f3e9a49553ecb9bc4a68afe74cf8c81baef83ae43e556"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.37/stryke-v0.16.37-x86_64-apple-darwin.tar.gz"
      sha256 "bdf017492218853bd5f828704c4ebb2e72acddb22b69b45c158ee22b2e504e2f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.37/stryke-v0.16.37-aarch64-unknown-linux-gnu.tar.gz"
      sha256 ""
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/strykelang/releases/download/v0.16.37/stryke-v0.16.37-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "46817cffc5c8caffebdf74d354984c8033d598a98806914c5419f51036889f6c"
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
