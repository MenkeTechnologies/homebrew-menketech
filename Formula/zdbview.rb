class Zdbview < Formula
  desc "Terminal inspector and CRUD editor for rkyv archives and SQLite databases"
  homepage "https://github.com/MenkeTechnologies/zdbview"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.13.0/zdbview-v0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "2479954ca2017806d7edb8f4f54159673eddf3bf736c6f522862c6967d2c9e46"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.13.0/zdbview-v0.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "7b18e8d5e232b411fb3ac37630df2663bcd58e62a7394ecc28317e28dbfcb696"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.13.0/zdbview-v0.13.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c6994a2a6fff67059b358e976c69c55808dc76e67dc14ec35efce7a63234302d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.13.0/zdbview-v0.13.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "058c4bdfb37c3baa330f44cfb73eb4879fb6e46e2c3a578ff17d4c3bb9d75abb"
    end
  end

  def install
    bin.install "zdbview"
    man1.install Dir["man/man1/*.1"]
    zsh_completion.install "completions/_zdbview" => "_zdbview"
  end

  test do
    assert_match "zdbview", shell_output("#{bin}/zdbview --version")
  end

  # Static musl tarballs also published at this release:
  #   zdbview-v0.13.0-x86_64-unknown-linux-musl.tar.gz
  #     sha256: 3e68fee9cd658c6c113b86f39856b888c28dea73fec42df393d1c1cc5bfe1a64
  #   zdbview-v0.13.0-aarch64-unknown-linux-musl.tar.gz
  #     sha256: 3ff55c41f930bb6a6d2f2b9b5d30a95dbbbf7aa89da6ef9f3a5e2e469d8ef502
end
