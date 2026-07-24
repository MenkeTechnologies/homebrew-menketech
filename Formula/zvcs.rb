class Zvcs < Formula
  desc "Git-shadowing superset VCS with lock-free many-writer commits over submodules"
  homepage "https://github.com/MenkeTechnologies/zvcs"
  license "MIT"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.3.0/zvcs-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "257a8cc9c3b164e80cddc9efd5f0dafd9cf6695bc6b1bdcc7e6b3a8bdc6bc4bf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.3.0/zvcs-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "62d9181f913dd03343ceaa0b5034d52ca040cb1076d9e2504b3ce2e1455f8239"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zvcs/releases/download/v0.3.0/zvcs-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6922b78e7a2bd81101916313662324b4b7dabc681879db8b281f1fb09faf6483"
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
  #   zvcs-v0.3.0-x86_64-unknown-linux-musl.tar.gz  sha256: 6850e3fa8170a9ea52358510621dc6a53392b1fbec91c881aa5c81765d2dd123
  #   zvcs-v0.3.0-aarch64-unknown-linux-musl.tar.gz  sha256: 9b7df27ee7c8358cf57466db37ceaf02a87cae01e05ba3db1e7e3998c7f18746
end
