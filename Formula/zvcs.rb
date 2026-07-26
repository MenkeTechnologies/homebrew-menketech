class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.10.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.10.0/zvcs-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "7d4cf7cd0fa53c4062ac68e05dfbde89acfb2ae55d41e4063a94675687502b43"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.10.0/zvcs-v0.10.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "094cd2e349eeee050019db4d167887cfa8facbf0806047417e1c9682494eef7e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.10.0/zvcs-v0.10.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "75f6978d02b6a862d609cee7202a040485dbf4e7a4f63fdb383ac830a7a1734b"
    end
  end

  def install
    bin.install "git" => "zvcs"
  end

  def caveats
    <<~EOS
      zvcs installs the git-shadowing binary as `zvcs`, so it never clobbers
      the git formula. One command installs the shadow and prints the shell
      lines that activate it:

        zvcs zshadow

      Put those lines in your shell rc (or eval them in this shell):

        eval "$(zvcs zshadow)"

      They put ~/.zvcs/bin ahead of stock git on PATH (a `git` symlink to
      this binary, plus a `git-<verb>` link for every verb), ~/.zvcs/man on
      MANPATH, and the zvcs zsh completion on fpath. In a new shell, `git`
      is served by zvcs; drop the PATH line to undo it.

      Re-run `zvcs zshadow` after `brew upgrade` so the symlink follows the
      new build.
    EOS
  end

  test do
    assert_match "superset verbs", shell_output("#{bin}/zvcs __brew_test__ 2>&1", 1)
  end

  # Static musl tarballs also published at this release:
  #   zvcs-v0.10.0-x86_64-unknown-linux-musl.tar.gz  sha256: 3d293351a3c60da78b9a91ffa1c18cf783680bd1fc48c087dd65df1864426627
  #   zvcs-v0.10.0-aarch64-unknown-linux-musl.tar.gz  sha256: e2139ddb3b842d6ac1d00a1d6e75c59f9cc6b616b0e91a9d42a2d488c1267500
end
