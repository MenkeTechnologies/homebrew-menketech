class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.12.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.12.0/zvcs-v0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "7e0028d28f8b6e86162d6e611fcb11ef7ff1424b323b774b2a44a34c7ec7ee57"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.12.0/zvcs-v0.12.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "00d00a5031bf5532937698ff375a095c783db735637c575819f70856d41641ba"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.12.0/zvcs-v0.12.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "661b1babfc9f7afcc550d87520487ffe232a5e9693c04d3ddd35d2c1e63d976e"
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
  #   zvcs-v0.12.0-x86_64-unknown-linux-musl.tar.gz  sha256: 816f31f55f2390fdc81a72ce3363a95ce16453043d31f234160cc0dd430928a6
  #   zvcs-v0.12.0-aarch64-unknown-linux-musl.tar.gz  sha256: df72892bc98c3216dad9977d60805207968b428eab1f7a5bf4b2fcd7d47f9b27
end
