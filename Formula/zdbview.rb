class Zdbview < Formula
  desc "Terminal inspector and CRUD editor for rkyv archives and SQLite databases"
  homepage "https://github.com/MenkeTechnologies/zdbview"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.6.0/zdbview-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "2dabdfff0e9ddde7b25926fe3af9f9c9afb3f3bee3ad468f8084043f238c4b84"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.6.0/zdbview-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "1b6dc7bde020d7925ed0d06e10b9ebb89788e67d5221031d6dfdbfa871a649f6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.6.0/zdbview-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "689067d9433a96cda2daf6b07c47b33c414c9271a03708fd45be989a1d0c03da"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.6.0/zdbview-v0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9e3374893fe43bf69d4d1d86a61ef263bbb86018a705f0cdb39c3c912056661e"
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
  #   zdbview-v0.6.0-x86_64-unknown-linux-musl.tar.gz
  #     sha256: 067e6669aaece6d4a6c8f66110c43c8ce02b632bf3a3ab232c68ddede0284d79
  #   zdbview-v0.6.0-aarch64-unknown-linux-musl.tar.gz
  #     sha256: b52cab9b3b59cba33eb031eb328453694c79a385aa1bcfd7cbc23f013df06c44
end
