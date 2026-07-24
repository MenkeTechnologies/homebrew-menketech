class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.4.0/zvcs-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "2897e7418f4391f147be1880c4bb597c956b8b61eba08f9e7d39ba06b8ba4a20"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.4.0/zvcs-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ba0d6e09aa0139db0e2daae8bf0978e488051eb1c6afe88a716ca2985c413949"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.4.0/zvcs-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "de6e41949d85d593a5341872fb2799cb3aa44cfaac8ae3f2519f5d91d4aef4bf"
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
  #   zvcs-v0.4.0-x86_64-unknown-linux-musl.tar.gz  sha256: f8e128056e4ce0c6f6eb68374fc203453123b9459f29343c0b56e0d9bd39b1b9
  #   zvcs-v0.4.0-aarch64-unknown-linux-musl.tar.gz  sha256: cc9553911c2fb83a8bfdbb410633d38d0c3f0d7706e8cef6cb747823d88ffd76
end
