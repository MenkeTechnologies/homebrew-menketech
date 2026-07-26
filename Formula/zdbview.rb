class Zdbview < Formula
  desc "Terminal inspector and CRUD editor for rkyv archives and SQLite databases"
  homepage "https://github.com/MenkeTechnologies/zdbview"
  version "0.11.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.11.1/zdbview-v0.11.1-aarch64-apple-darwin.tar.gz"
      sha256 "b0cd3ebc2042d61332095f18c3da4470cd99ba8ac6aaf86751061c0beb0f9a63"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.11.1/zdbview-v0.11.1-x86_64-apple-darwin.tar.gz"
      sha256 "8665a7a7b3c1786693c935eacc96e020a04f7fbd83d01dbe5d68f03ab4725465"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.11.1/zdbview-v0.11.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5e9a79cd3cde8b9408bce210193a81150377773fba22d73e026cbfb325199729"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.11.1/zdbview-v0.11.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "52537c71df78cc033878110956932373fe9bb5ef52dbb2212a353825c25d1f49"
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
  #   zdbview-v0.11.1-x86_64-unknown-linux-musl.tar.gz
  #     sha256: 3a43cd599dd7347d66b5a7f3aedec54ba5bdd0ea52f504a54586a3b21ee505b9
  #   zdbview-v0.11.1-aarch64-unknown-linux-musl.tar.gz
  #     sha256: d95f6eb1021219e3fa0f449fc6b5b8940734f5a60c351203fc5db789a88aa9bd
end
