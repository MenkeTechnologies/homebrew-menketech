class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.6.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.6.1/zvcs-v0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "87670509e6a38ab7b6f7e150fd8c8e48fb2130bf421d193398605ccbd88a6802"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.6.1/zvcs-v0.6.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3c6a7600c9d6dd7a78979217cd865e6d69ef4f650874461e66e091afb8d7a0d0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.6.1/zvcs-v0.6.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7d7c436847c0d5f009409ab36161eef7bdc890c1129259e2ff6e49d09bd10a15"
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
  #   zvcs-v0.6.1-x86_64-unknown-linux-musl.tar.gz  sha256: 1741966a95f644a2b6cc1711b6e1c874550be0f89cd6d39b8e3a4947112c4baf
  #   zvcs-v0.6.1-aarch64-unknown-linux-musl.tar.gz  sha256: eb3da4df436b1b469801286121bc79142136c8555b45f999fee3fb5202eb8271
end
