class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.7"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.7/zemacs-v0.4.7-aarch64-apple-darwin.tar.gz"
      sha256 "d321c83709a1690a776df3b93448fc5f256d846a5c7cd0b32a81477a8ca3ec2b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.7/zemacs-v0.4.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aa672b8efdaef92d916fa3f37b32f6de96265c8900f0330265a46beacfb55d62"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.7/zemacs-v0.4.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "10eb7f0ed796f99f841688558a0676a3956213665bcc8ceaebba3df62100eb1c"
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
