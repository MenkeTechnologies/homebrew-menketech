class Zdbview < Formula
  desc "Terminal inspector and CRUD editor for rkyv archives and SQLite databases"
  homepage "https://github.com/MenkeTechnologies/zdbview"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.4.0/zdbview-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "6c6bac6a5453bd351bf51dba853e4c52cf56a75e7561d207d75f4ce266c9e5f8"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.4.0/zdbview-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "a2205d29eaef34a4e374736891e591c68d9f9b925c519be16440b5d8f3962091"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.4.0/zdbview-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0d93b92d6561debdce06e5abd6290d6f1fe7d248efe685581efdbbb9f3cab4b4"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.4.0/zdbview-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aa2d230a7aa329e5ad2ea37a6ab2223260b3583997232151856cd421bf5cca4e"
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
  #   zdbview-v0.4.0-x86_64-unknown-linux-musl.tar.gz
  #     sha256: e0cd8c4238467d38bea614914428dc6c356305160f9f1b4ef811ad7e40e5127e
  #   zdbview-v0.4.0-aarch64-unknown-linux-musl.tar.gz
  #     sha256: 4798bb01a369a20de0e99535ee3f97b3b4c9a03a974d7a629218ce0f3e053ea2
end
