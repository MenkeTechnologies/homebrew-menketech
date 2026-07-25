class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.9.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.9.1/zvcs-v0.9.1-aarch64-apple-darwin.tar.gz"
      sha256 "c1afbb35e240cf4ea21697f3beda0d818c526cc175d3d9da2a6854d898a73617"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.9.1/zvcs-v0.9.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8b1887180730e7d69a7b204cc264ff28f3b476ad5fb90d86abbcfe843bf2ebf2"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.9.1/zvcs-v0.9.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "947d3e5ff0ab1fc6462b0fd72024624c78d92e204d5ed37d5c3eb56b44ba5dda"
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
  #   zvcs-v0.9.1-x86_64-unknown-linux-musl.tar.gz  sha256: 89ed7c106bdaf29aeb9d4418a5bcf9d6a6d1b80e4ab59cf83ca0024b162efd25
  #   zvcs-v0.9.1-aarch64-unknown-linux-musl.tar.gz  sha256: 8a40a26ed6ac3c82f24c8ae2590e709936f999f4274339c962c5624cc73d9c19
end
