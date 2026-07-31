class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.14.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.3/zvcs-v0.14.3-aarch64-apple-darwin.tar.gz"
      sha256 "1e02b7ae8c8b9fb52c09de165c03ac4b40fcb673cca7bf9a94ddc9f63ad1ec50"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.3/zvcs-v0.14.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "057f980e1ef6e4a53d377695aa9917d5959b3669a73748ffc34d038ae4e7aa76"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.3/zvcs-v0.14.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b7220c826e5bbd1bc3d0c6423675a8e6408d03aac49493626b562e18e6e8c6fe"
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
  #   zvcs-v0.14.3-x86_64-unknown-linux-musl.tar.gz  sha256: 39964999a79ef5d47f09bcd5cd7de6b28d37874ca73571c09b7561b7c5079d3a
  #   zvcs-v0.14.3-aarch64-unknown-linux-musl.tar.gz  sha256: 881351e5f7a82d1f803fa0d968f2b63199eb3418a7d99ce18bb83a126c053fc0
end
