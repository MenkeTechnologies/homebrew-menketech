class Zdbview < Formula
  desc "Terminal inspector and CRUD editor for rkyv archives and SQLite databases"
  homepage "https://github.com/MenkeTechnologies/zdbview"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.12.0/zdbview-v0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "732c038a35d4059a8c46a71d85a47ff4dee6e222b726aab541938f015d916235"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.12.0/zdbview-v0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "56c5f6774897a0d27afd75702148178ee761a8e548bbc5182e8254e9b7f19a3c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.12.0/zdbview-v0.12.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ad3823ba4f7129d2d24c2ce7d61e4918e6dcc7ab05a15ab54752ec107ddf5b51"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.12.0/zdbview-v0.12.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "535b3accfaa5c5ecef244b11faa63db4ec5eecd7c5f29a5b8917c2c03e4de399"
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
  #   zdbview-v0.12.0-x86_64-unknown-linux-musl.tar.gz
  #     sha256: 4299b1542174c737c1c323cb367a5c568163d664106d9726021781aee8e66744
  #   zdbview-v0.12.0-aarch64-unknown-linux-musl.tar.gz
  #     sha256: c8006d7b749c1fe35f15f8114ccdc6e566342786af83ad5c48e18ba32887d45d
end
