class Zdbview < Formula
  desc "Terminal inspector and CRUD editor for rkyv archives and SQLite databases"
  homepage "https://github.com/MenkeTechnologies/zdbview"
  version "0.13.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.13.1/zdbview-v0.13.1-aarch64-apple-darwin.tar.gz"
      sha256 "db7a5cd6af418e0df78d3dab746446c6eeedf539857a957b71e2122a4dbc72a3"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.13.1/zdbview-v0.13.1-x86_64-apple-darwin.tar.gz"
      sha256 "064f9af220f126ae98373244dc9e5fa0070aff093a65a30d7135f03ad72ab646"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.13.1/zdbview-v0.13.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0fcf164369c0f136f067dbf328821353bb81687f42b12141957071f37be33486"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.13.1/zdbview-v0.13.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8b9a4f7f6251f890ad15eea8ed84ba13e46c712d45af8ab4b2f2eff9d0a5c529"
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
  #   zdbview-v0.13.1-x86_64-unknown-linux-musl.tar.gz
  #     sha256: dd9a2ba6cf673a2b2f4cd29168380ed6db0f7c9e42ffab379241f6e5f8e3c3e7
  #   zdbview-v0.13.1-aarch64-unknown-linux-musl.tar.gz
  #     sha256: abdc2ff504845d11f291da0867854e07ced51c86ef4a063f9b5bfc96a71fc1aa
end
