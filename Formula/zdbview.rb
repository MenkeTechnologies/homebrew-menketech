class Zdbview < Formula
  desc "Terminal inspector and CRUD editor for rkyv archives and SQLite databases"
  homepage "https://github.com/MenkeTechnologies/zdbview"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.2.0/zdbview-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "7f733a7c5d92d5ed5442b3e3bbd57afbae01c03c2bb03d5231d2e2f114763295"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.2.0/zdbview-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "6568db13f3e693e41790efe25771578e1e1534b5f25bf0a2b490cebbef6ef800"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.2.0/zdbview-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "348f0f2ef7c51c5839cee64060b4425c10c54963dee9fe97a21abb8589f94355"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.2.0/zdbview-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "035a7e7cef50174f2bcf2b367288695c7ca51217bd0ff7647a58d336e8639bf7"
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
  #   zdbview-v0.2.0-x86_64-unknown-linux-musl.tar.gz
  #     sha256: cbcb0dfad846e6988c861aa6906fc16af41cf0ae3497f3797f431d4577416bfd
  #   zdbview-v0.2.0-aarch64-unknown-linux-musl.tar.gz
  #     sha256: b22f0faff5add6a5234aeee6aa0a3f20234801a78b3c3d96995f84587bfe12c8
end
