class Zdbview < Formula
  desc "Terminal inspector and CRUD editor for rkyv archives and SQLite databases"
  homepage "https://github.com/MenkeTechnologies/zdbview"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.1.0/zdbview-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "f7b37ebf95e28e201d8a4113019e029e2bc192f043d57d814ccae0bb537ace36"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.1.0/zdbview-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "ff08c9acd7bfff9b851e883b0073914b917236b7b9146ec37448ab2faa1beb9c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.1.0/zdbview-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1154f52574e54b763543f4ea10262287ea018d36ccafede40b6abe8121b08419"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.1.0/zdbview-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fff26dcf4b9bb7983279992e9ff5efbbdc42683ec8f8447a8022f2726bd280de"
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
  #   zdbview-v0.1.0-x86_64-unknown-linux-musl.tar.gz  sha256: f94994ed7e0d55e2d88d71a3b4abfad52ca9fa455aadd99d790880b61b894ce7
  #   zdbview-v0.1.0-aarch64-unknown-linux-musl.tar.gz  sha256: b79a60a69c99cadc8a8ac75140422f40178890eaf69bb3d9c124ecf6fb4b4d43
end
