class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.14.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.2/zvcs-v0.14.2-aarch64-apple-darwin.tar.gz"
      sha256 "e9c3b7f16457541ebd6be99de405e317fc82dd59668aada42b59facba6f78bca"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.2/zvcs-v0.14.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "374650d290a019f0cc870fea0f65163163523a1bcc479292c44704e7f4d36ec0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.14.2/zvcs-v0.14.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "94ff47be3b5f13a80fa024c0e40c3a8d65155f189c7d196559a2ad9fa9c69bd1"
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
  #   zvcs-v0.14.2-x86_64-unknown-linux-musl.tar.gz  sha256: 975ff0a5e282337d4cb4345e135ada47a6fa8b0bf4b64a2181cbd794f4781351
  #   zvcs-v0.14.2-aarch64-unknown-linux-musl.tar.gz  sha256: 46701aa5e8c62559034dc4ea2c7f20bace1aab9e4cf280ef659fea62e0d957bb
end
