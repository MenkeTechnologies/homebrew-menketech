class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.2.23"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.23/zemacs-v0.2.23-aarch64-apple-darwin.tar.gz"
      sha256 "bb6db5e91409b836e71cca9036499e37ef6f7e868302c0ce6b093f0b38d0a61a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.23/zemacs-v0.2.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5ddc5e1707ab3edadbf878df7708168c6860fdb9b708278e010f048b9ba74ba1"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.23/zemacs-v0.2.23-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "521865cfaed4011518511fb4740563c25eeb543429fcbb2744aba74751d94498"
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
