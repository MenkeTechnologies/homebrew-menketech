class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.2.24"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.24/zemacs-v0.2.24-aarch64-apple-darwin.tar.gz"
      sha256 "53aed10046b77df209b7a108297de61911a6591ff23374944b5c6a3e9867f832"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.24/zemacs-v0.2.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "681fd7359ff849b5166369674ef4c1d5fc4aa3b238d6879da1bdae076990bb1f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.24/zemacs-v0.2.24-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0c47f6a8b6647b52be2d3867e4caa3ab0429534da10ceb6d1b7e6f26e457c679"
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
