class Zdbview < Formula
  desc "Terminal inspector and record editor for rkyv archives and SQLite databases"
  homepage "https://github.com/MenkeTechnologies/zdbview"
  version "0.13.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.13.3/zdbview-v0.13.3-aarch64-apple-darwin.tar.gz"
      sha256 "71bdc5eba18602930980005f84eebccb78507fc381f6b846c2dbe4599f8a2cd1"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.13.3/zdbview-v0.13.3-x86_64-apple-darwin.tar.gz"
      sha256 "36ab0e753b66f4e4d7be71ac558481b00c47c9c47bf6ffb6f4c678d07e630a47"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.13.3/zdbview-v0.13.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c1238fd7fe3e5c248665a7e2f7b96a04645e5769745c0693228205322808be29"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.13.3/zdbview-v0.13.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "68dc9bad0372d2f762ea87c7f1c74cfbf6491284386d62e6f48e0c4f30faa1d1"
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
  #   zdbview-v0.13.3-x86_64-unknown-linux-musl.tar.gz
  #     sha256: 0db1339e2eecb145990809cc4f2a44f62f932146dccc65b3e56ad4034c1b1c1d
  #   zdbview-v0.13.3-aarch64-unknown-linux-musl.tar.gz
  #     sha256: 14ab5df3389039ea1bb35ec938a8a9525cc76bae37c6820bdb18e6558481083c
end
