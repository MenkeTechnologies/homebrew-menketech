class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.22.9"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.9/zvcs-v0.22.9-aarch64-apple-darwin.tar.gz"
      sha256 "4384730f55e81194aa7bb115920025551d66d6aa9c8fb9fc0b58663501f6277a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.9/zvcs-v0.22.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "395bd559e7ee36b3fd9f0dc693f168a7dc381b1daf88059d924e48121aef61b0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.9/zvcs-v0.22.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "117443e3bf97b7b8a528da9acf384da7c2d35311bbdc331dd8fee8de8b7ecf8c"
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
  #   zvcs-v0.22.9-x86_64-unknown-linux-musl.tar.gz  sha256: 7b02ba09d1fab93375b5643e7c7b04ec32a49f1b4a5de6b3b8a8aa48107c414a
  #   zvcs-v0.22.9-aarch64-unknown-linux-musl.tar.gz  sha256: a89d222e7bf5e48f8e8f0cb92842bca5262c7b0056647074aa088e68f5599d24
end
