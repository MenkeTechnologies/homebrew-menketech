class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.8.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.8.0/zvcs-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "c0e7321d796c604523338f8999284675210e22a107a57da8fb16293195dbfaa4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.8.0/zvcs-v0.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8bfbd3db400a49e4c61ab2639e335cfeafd5efa0f8619869c979a87cae6cb7eb"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.8.0/zvcs-v0.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "232bd298931733ec82b105d073d8253490411def83d1ee8a39481f580453f1b6"
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
  #   zvcs-v0.8.0-x86_64-unknown-linux-musl.tar.gz  sha256: ac4a364eb554cb87989c5ea2b215c8ff413c9e1d61967e9252a12514ac5daf3a
  #   zvcs-v0.8.0-aarch64-unknown-linux-musl.tar.gz  sha256: 0370c6d99faeded1396c167bbaf398d31db1f694e88dcc76b9017b5af7274184
end
