class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.20.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.20.0/zvcs-v0.20.0-aarch64-apple-darwin.tar.gz"
      sha256 "e5867c1661bcde92dd7797397ef8c34a8b6c8ed5e92f93ddaaa41eb2c3f8894d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.20.0/zvcs-v0.20.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b3b0c7fa7c23e089324f4c906a2ac8ac61696188665f989bb9cbd8c2582e212a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.20.0/zvcs-v0.20.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "052bb79e823ff34d31434ea7768c2095656821528d75986f847890533252ac0c"
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
  #   zvcs-v0.20.0-x86_64-unknown-linux-musl.tar.gz  sha256: 68f0d24de591cd36a4a150a0db1a9a20a382c9eb588ec5e004ef662f00eb6668
  #   zvcs-v0.20.0-aarch64-unknown-linux-musl.tar.gz  sha256: bd40c93b0f1026ecbf9cf42e19a38e2c3343acf24a83f47641ab3a2286b4a725
end
