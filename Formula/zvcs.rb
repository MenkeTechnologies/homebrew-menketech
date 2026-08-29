class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.22.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.2/zvcs-v0.22.2-aarch64-apple-darwin.tar.gz"
      sha256 "5357beb0525ed8ba081973270bb64e040a13d95606d997a9e5a9e9a077aed0c4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.2/zvcs-v0.22.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c9ea1bb314206d6c599d2a691f67315fba943c86452cd329b6d35b1a5816559a"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.2/zvcs-v0.22.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "28a7252f1c207f27298acc7b337708e008a28bd3b440b41a5b561c8ab8228520"
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
  #   zvcs-v0.22.2-x86_64-unknown-linux-musl.tar.gz  sha256: 3c6e16de6dafedd913e398df80c7eab4d9a3267d2c252a055dd97a0dffb42c7e
  #   zvcs-v0.22.2-aarch64-unknown-linux-musl.tar.gz  sha256: f431d07b1929d39423cfb17bab48b70b8400c910e15eb664bc2715e253cfaee8
end
