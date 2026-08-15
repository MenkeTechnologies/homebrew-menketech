class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.14.13"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.13/zvcs-v0.14.13-aarch64-apple-darwin.tar.gz"
      sha256 "8e14fe7355f9a74cdec648b143c3462b5dc4504f89c9b4fce1c35e171296e066"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.13/zvcs-v0.14.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8dcd8247d92731c0de5ef2b6f2db122d41f593bb798b41e728b910816eca8162"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.13/zvcs-v0.14.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "19bf85882168678d7f75ace513c4d67228373ffbe3ef6a5eb658263415c6d856"
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
  #   zvcs-v0.14.13-x86_64-unknown-linux-musl.tar.gz  sha256: a0b9c67c91e7f1e7ac2b86586773a908cfa9e622220dcd1611ec3ec3aee1e82f
  #   zvcs-v0.14.13-aarch64-unknown-linux-musl.tar.gz  sha256: b66e33ea0ca5bec9058f806ae3761d87a13b26d3a630c04d72edfbc7100f163d
end
