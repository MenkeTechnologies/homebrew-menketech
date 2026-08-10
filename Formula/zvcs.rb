class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.14.10"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.10/zvcs-v0.14.10-aarch64-apple-darwin.tar.gz"
      sha256 "7cefe70c0e34b99b428f6676aa4ee10d86fd45323af2b25613e4613844a6c570"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.10/zvcs-v0.14.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7860dc6f1a9a5ed4596b155b21e86eff54d46383b7cac487838699837186ca23"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.10/zvcs-v0.14.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "97778b0ddd21eb6eb8897f0a9307d9cb5bed47d485c50d49028642a8616ad9e2"
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
  #   zvcs-v0.14.10-x86_64-unknown-linux-musl.tar.gz  sha256: 39b86c48b23c7100169b7043366c00a47cbe30a127d6c7b2553a7cdfcbbef18f
  #   zvcs-v0.14.10-aarch64-unknown-linux-musl.tar.gz  sha256: a2fb36855701a53439c5580392b349822c43e587d43463753dfd39503002769b
end
