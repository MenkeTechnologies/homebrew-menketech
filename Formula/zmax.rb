class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.49"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.49/zmax-v0.4.49-aarch64-apple-darwin.tar.gz"
      sha256 "debbcd14fa50cb28ffb1e93fc43eb8f58b105cc4236dfb63e24197b01d9904fb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.49/zmax-v0.4.49-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "27a5385ec980995de577bcacfd50b003a12996111969eae5ab311e65496a4c8b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.49/zmax-v0.4.49-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ca336c5cff60e22b7ee8411bf41f2ed38647dcf28560cd61095a2342c30b7bc3"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"zmax"
  end

  test do
    assert_match "zmax", shell_output("#{bin}/zmax --version")
  end
end
