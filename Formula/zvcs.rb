class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.7.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.7.0/zvcs-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "d090c821773e616238aac921b65a89e326f1bd46296c0a0d7dc5f169c5f110bb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.7.0/zvcs-v0.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e041d419aff60e7c731d4309e07a5ac72696819e2a613a44c7de581a3755b3f3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.7.0/zvcs-v0.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8979475db89526e22a2b9184b412a921716b1c20a118dd40b115928040721392"
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
  #   zvcs-v0.7.0-x86_64-unknown-linux-musl.tar.gz  sha256: 8fe0bd7b6483d35b1aea43018224770e612489ef284b1a8f0b71c45403b1a954
  #   zvcs-v0.7.0-aarch64-unknown-linux-musl.tar.gz  sha256: 0f8211e0aab70d9cf9be0e8b99cb2e19a1be723362605f0673a4f3d31eb79be6
end
