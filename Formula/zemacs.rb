class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.2.5"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.5/zemacs-v0.2.5-aarch64-apple-darwin.tar.gz"
      sha256 "b93e6f32538b534869b5dbb6751f99f7c42e6a08b818fd9ddb28e107dbce8455"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.5/zemacs-v0.2.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "096b73ad6a0de4ad73daaaaf4c2d8b37748158f7f85bf45c534179c57c98a6b9"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.5/zemacs-v0.2.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "12de45e12717d40086d13aafeddef0be2d99f6a15c89e62f4abc9a662535f8b4"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"zemacs"
  end

  test do
    assert_match "zemacs", shell_output("#{bin}/zemacs --version")
  end
end
