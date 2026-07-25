class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.9.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.9.2/zvcs-v0.9.2-aarch64-apple-darwin.tar.gz"
      sha256 "20fdb7c2256b6362400de784119fda227059af2530183cd6e7e24fe0bfb231f7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.9.2/zvcs-v0.9.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f96c1d0b1f6381340ff78a839859044b69944539b1fb6925d42a0b829a7ef4d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.9.2/zvcs-v0.9.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1e892869eea92ef3ca59db98111501e1ff49b8a25363da6a526879527abbca70"
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
  #   zvcs-v0.9.2-x86_64-unknown-linux-musl.tar.gz  sha256: 7fe7722f16cda8bd1ae1fddfa6be731b1a97177f40aeca3eea4dd0242da5060b
  #   zvcs-v0.9.2-aarch64-unknown-linux-musl.tar.gz  sha256: 719be39ffe7efb99b5ba63bbb821ae04e66d06c6b2f9013d6d910f85b38593fa
end
