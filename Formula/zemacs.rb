class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.2.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.3/zemacs-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "902c1dcc7afa242f7e3694bd07e0703cc51132f6506dad5d01be23dbc929448c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.3/zemacs-v0.2.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1b302d267d747bde35a9650b1de06480138f9a3b52743e484e786ed5796cfbea"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.3/zemacs-v0.2.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bf793e04ea2e266dc35174a2dc40f7e24bc44fe2ece0f3439f46c274f6af91ef"
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
