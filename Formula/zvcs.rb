class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.14.7"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.7/zvcs-v0.14.7-aarch64-apple-darwin.tar.gz"
      sha256 "a235fe77b59ba7836fbb7864f85d1e6969963ef5877d0f10fe83dcab74cc71ff"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.7/zvcs-v0.14.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "12b2d8b41ee665a2d1942e9b5250e0cbaa631f028cf2549e1e9a88d74b34734f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.7/zvcs-v0.14.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cfca781445eed8a3ae1c268567f53e09a8512890277aec90b4c16080bf16490f"
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
  #   zvcs-v0.14.7-x86_64-unknown-linux-musl.tar.gz  sha256: 9261160edc553667fcee12b4636a9292bbf9d9d0f18f3a7264e5b6c1175c6564
  #   zvcs-v0.14.7-aarch64-unknown-linux-musl.tar.gz  sha256: 45370c872365c677ca553dad8f6fe1dd9083d77bde2ccefa15bcdc9ab7e92ab5
end
