class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.4.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.4.1/zvcs-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "e8a3932b9a42d9b705bae8c7cde92a6b865ee7033acc7620f1a367f875bc4e6c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.4.1/zvcs-v0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "71f741c38ba44960e29a330bb7c7bf2feb8469ab6a082157dfd91a4245d8d04b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.4.1/zvcs-v0.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9e9bb13d810bc4ebd407c1f9836b94a0a8788dac56848e342f9850202b6b1eff"
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
  #   zvcs-v0.4.1-x86_64-unknown-linux-musl.tar.gz  sha256: 92ca1e2c9c65f8b8d5ab652cc8dcef6c4002c93caa84afb71fcc9e721cbf16d9
  #   zvcs-v0.4.1-aarch64-unknown-linux-musl.tar.gz  sha256: a9a0a50e5d5085908467b349947eeb10ec7bcab5a12b8375023b47a22f8d87d2
end
