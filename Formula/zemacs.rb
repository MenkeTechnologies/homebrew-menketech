class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.15"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.15/zemacs-v0.4.15-aarch64-apple-darwin.tar.gz"
      sha256 "a76eb4da75dcc698e59552333eb450ab8907a0a5a591117185098713682ff0d5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.15/zemacs-v0.4.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "40886af1335a93c7f501414dea8daf93439ff5656d25f7372d24d158c4245944"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.15/zemacs-v0.4.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "70eebc4a59c5ffdc6d58c6772ee3f64fb34609f39b50100b3f09bd389c049645"
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
