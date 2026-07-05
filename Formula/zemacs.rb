class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.2.21"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.21/zemacs-v0.2.21-aarch64-apple-darwin.tar.gz"
      sha256 "0ee45e78f8a0e511efab5288f7b34374d4cce6c8ab148f3998cf276957ac42d7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.21/zemacs-v0.2.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "758c31d2550e7f562290efae34d58d8bd5b18aef4829a63d58f9bbd23f9ff043"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.21/zemacs-v0.2.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2efe8162ebbe163f0573a95bc5c144a735c1c6dd318285574bfba4dfc06ee1c7"
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
