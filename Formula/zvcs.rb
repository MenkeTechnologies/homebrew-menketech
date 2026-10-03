class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.22.10"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.10/zvcs-v0.22.10-aarch64-apple-darwin.tar.gz"
      sha256 "4092d08ddf4a2a6e34c9d095a86ba91d757f4a6a2e346884b473ce3db860012a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.10/zvcs-v0.22.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "18396f0b21180c98da06b76c944c69901a6da1af23e4d91fd814e60ee8197eb5"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.22.10/zvcs-v0.22.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "827bde68ab860bbebbd8d5f7685327e97063beeda412854296d1f422fb60973b"
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
  #   zvcs-v0.22.10-x86_64-unknown-linux-musl.tar.gz  sha256: 4bf0bc4a9e2da6744048455b95ba6a06e7a101f0900d43b263838742a38fd688
  #   zvcs-v0.22.10-aarch64-unknown-linux-musl.tar.gz  sha256: bd6c5902e56a1bf0249c4d9ed67dfb3104ab6cd758cf250d4adb170b84967ff0
end
