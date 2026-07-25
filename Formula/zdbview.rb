class Zdbview < Formula
  desc "Terminal inspector and CRUD editor for rkyv archives and SQLite databases"
  homepage "https://github.com/MenkeTechnologies/zdbview"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.11.0/zdbview-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "0493fc3d7878cc05543597652db34cf22a6590d2481a6083c22eb3008fee9ffd"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.11.0/zdbview-v0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "bfc405462c489d745a538d24844fb57481896d82baba838719c668c9bbe9bf2f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.11.0/zdbview-v0.11.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bf1e9f532442dedcf6557c2d938578d2f0fe91fc9f657e05369250884907a8b3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.11.0/zdbview-v0.11.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a0281ce4c7a00e1df920550c59a4187d51fc6d67274c0a9801c41ea8c79d7a1c"
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
  #   zdbview-v0.11.0-x86_64-unknown-linux-musl.tar.gz
  #     sha256: 690c22ad10f2623729a0e96f3ffd320a7a27de76aea52c094c6cd60a9c1231ef
  #   zdbview-v0.11.0-aarch64-unknown-linux-musl.tar.gz
  #     sha256: 0fc52550cce83c5958b30be9f7f34a97d2414a23adadb376943c7d027a84c91d
end
