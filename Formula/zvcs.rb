class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.1.0/zvcs-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "af1487246023b1dacf2ab4975f11650b6a53cc22b9a5219e654127c7886aab30"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.1.0/zvcs-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d5c42383e69480335d4e80db7714f42e85b7b4b2bf7cb542b0a0c2561b540e7e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.1.0/zvcs-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e912fb6bece921c77d03aad1b9d0eac500ec4dce9afbb9584c85d570a5043ba9"
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
  #   zvcs-v0.1.0-x86_64-unknown-linux-musl.tar.gz  sha256: 57b8b3e5e5809a7318d2683042c590d91358664c9e49da27d963228752d6410a
  #   zvcs-v0.1.0-aarch64-unknown-linux-musl.tar.gz  sha256: 8c860fb082d65b5840b870b05852ded3be60d0bf4ef2d3d87227c6c237aa26e0
end
