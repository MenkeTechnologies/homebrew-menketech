class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.6.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.6.0/zvcs-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "63de1268f6e7eaa3ad06038cdb7765a76713dd402ddc6b37e7e87bec2b75e2ed"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.6.0/zvcs-v0.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f05e67fb343f7f21ce4b7718d2734f44bea21ebfa9c308088539049bf34ea3e9"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.6.0/zvcs-v0.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bac58fcfacf7e9ebf765cb7757446b71fca68204f657064cceb3342af904afd3"
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
  #   zvcs-v0.6.0-x86_64-unknown-linux-musl.tar.gz  sha256: 57a394cad813f8691d2588df33b8e6c911bbed1e4881486b8be782504eac48af
  #   zvcs-v0.6.0-aarch64-unknown-linux-musl.tar.gz  sha256: 9ee65e81510ff320b94e85f772f942689c91fb8ba36c4dd3890ede5ebb8e32b5
end
