class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.54"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.54/zmax-v0.4.54-aarch64-apple-darwin.tar.gz"
      sha256 "670ff3c93dd8527b4c6a863f6ad693c1d46e73ab0a319d1756d617791befb6ad"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.54/zmax-v0.4.54-x86_64-apple-darwin.tar.gz"
      sha256 "7886ae3bf1202530d800a9b9d782a3acfd910d4fe8d49e3dc6c966c698f7ee73"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.54/zmax-v0.4.54-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a06d46a80f8f1804ffcd2a7f8dc25e94863156fbf72aaa2e1ed68bd6caf8dfeb"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.54/zmax-v0.4.54-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d6e2d69e95afd014a75801b00465e670acee80cae6c7030d89b724b268c4b51c"
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
