class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.10.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.10.1/zvcs-v0.10.1-aarch64-apple-darwin.tar.gz"
      sha256 "3c7904d3912b8f9a8e16342472e0ea52d9506fd89f24dc82180d3c336433f715"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.10.1/zvcs-v0.10.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "96d3e1a18e289cd5a40944f820a04783f896f76f041a429d628f8b1f3fde18f3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.10.1/zvcs-v0.10.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d8376e89c34e869dff1be4c9c70cafe88ddffe456dd88e7c8f22e60f0c79d75b"
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
  #   zvcs-v0.10.1-x86_64-unknown-linux-musl.tar.gz  sha256: 56c76b5e364f81644e92a1edbf2f06b3413101bf9d7af05892bd4b31d9bd1282
  #   zvcs-v0.10.1-aarch64-unknown-linux-musl.tar.gz  sha256: 518f6fc3a3e424f75cafaf2f81a95962aa703058f86629316e07fb7c53ab0be2
end
