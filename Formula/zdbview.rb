class Zdbview < Formula
  desc "Terminal inspector and CRUD editor for rkyv archives and SQLite databases"
  homepage "https://github.com/MenkeTechnologies/zdbview"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.7.0/zdbview-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "394aaa2ec00c0ffe9a645d82dcc9c1301a425d34201cd7e06b22a62e864d9799"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.7.0/zdbview-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "822e5450527ea0393440828e06a7e5ed69b3e4918563d1ea29a9385cf104e555"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.7.0/zdbview-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "103f20822c15df1038415c289e95fb291328f437923a4c26b45a12815a9ac2da"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.7.0/zdbview-v0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8a9f9e61d12da0d27dc4c817d5499550444b680c61c5235b1bcee4d18c6f2337"
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
  #   zdbview-v0.7.0-x86_64-unknown-linux-musl.tar.gz
  #     sha256: 995a428a20b315d23c52c69a19a01b2b84af1535ba618e081fc6a75b3bc30fe3
  #   zdbview-v0.7.0-aarch64-unknown-linux-musl.tar.gz
  #     sha256: 27e66e3f7a72491bbfee81cfbecbc3f4b024d5d4edc14f4b27f8081f7545fecc
end
