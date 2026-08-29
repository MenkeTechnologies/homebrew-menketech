class Zdbview < Formula
  desc "Terminal inspector and CRUD editor for rkyv archives and SQLite databases"
  homepage "https://github.com/MenkeTechnologies/zdbview"
  version "0.12.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.12.1/zdbview-v0.12.1-aarch64-apple-darwin.tar.gz"
      sha256 "4b98db2db50d1c7dad3f7d4d32a87e8aebcd6521a2274479b3bf78ee2e05a8f4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.12.1/zdbview-v0.12.1-x86_64-apple-darwin.tar.gz"
      sha256 "21b6814a6a7f35c1fcada9b324c99add4e8c7bbbf1be1b758ec186fb8c2889ae"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.12.1/zdbview-v0.12.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c4afcab150309f6148829d775ed0a90ef175e4cb0a5b007956c874d1f9495d3d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.12.1/zdbview-v0.12.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b2ff2da3c39cf4a2e32c87a340bd8835513783975de6e5d7057d171e6445a858"
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
  #   zdbview-v0.12.1-x86_64-unknown-linux-musl.tar.gz
  #     sha256: 36deab15c4759c3aceb4a7afb196ee61f885ef765b3a50582105b0e0564cd0bf
  #   zdbview-v0.12.1-aarch64-unknown-linux-musl.tar.gz
  #     sha256: 17015c10a0b387482bfa999130da2b5ee4eb15a18d2a09c7f2556785ab7f63bb
end
