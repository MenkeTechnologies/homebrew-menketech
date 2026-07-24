class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.2.0/zvcs-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "fbb2aa30220a1ac11bcabece540be2f6ab58f68d03d7d84671446f0027c1289d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.2.0/zvcs-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9e9f1d70987d40b184a91c9ebe8a2ad778478f683a97a1f322e2e83b3e5033cc"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.2.0/zvcs-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "40b2067a72777aa9116790a73f229a902cb5b3ce6658ac64685fb1b890c4cc14"
    end
  end

  def install
    bin.install "git" => "zvcs"
  end

  def caveats
    <<~EOS
      zvcs installs the git-shadowing binary as `zvcs`.
      To shadow stock git (serve `git` from zvcs), put it ahead of git on PATH:
        alias git="#{opt_bin}/zvcs"
      or symlink it (replaces git; reversible):
        ln -sf #{opt_bin}/zvcs "$(brew --prefix)/bin/git"
    EOS
  end

  test do
    assert_match "superset verbs", shell_output("#{bin}/zvcs __brew_test__ 2>&1", 1)
  end

  # Static musl tarballs also published at this release:
  #   zvcs-v0.2.0-x86_64-unknown-linux-musl.tar.gz  sha256: 1273e3a792ea46d3899095551e69645ffd94330e7cbd135f03d15ba4df6d7758
  #   zvcs-v0.2.0-aarch64-unknown-linux-musl.tar.gz  sha256: 0f8d90bb133963c1d31da91348370050e3b48a285490d78e201cd7ca0a82adb0
end
