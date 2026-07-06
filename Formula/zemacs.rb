class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.0/zemacs-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "d36d9e9bfb5fbec03f1fdbf972576d6b8637a7149684d8943790716b9ed7d8d6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.0/zemacs-v0.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "761ddc80797644efe242e470178838a7e65418311e4650e814c31c1bdbe714d0"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.0/zemacs-v0.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f24418ffa1705f586406e5d01a0cc58aae2966c72d72f046857c38c5e681a0df"
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
