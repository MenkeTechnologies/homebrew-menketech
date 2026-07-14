class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.29"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.29/zemacs-v0.4.29-aarch64-apple-darwin.tar.gz"
      sha256 "17b7d3cfbe9d75f7e16e2546de918d39652e8ae801666811e116d4cc311d6c8a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.29/zemacs-v0.4.29-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6b2137e56d512dfb6958979fa99954b4e37e751f70f0cf1fd1eb196ee205c684"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.29/zemacs-v0.4.29-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4bb0d0512ba92f2af6adeb6c9c391e5265b5ffcb887167171bcf6f7028a9968e"
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
