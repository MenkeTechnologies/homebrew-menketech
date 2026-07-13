class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.24"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.24/zemacs-v0.4.24-aarch64-apple-darwin.tar.gz"
      sha256 "2be03bc436fc595e10d6bce0f0dae8c6b52e3c4ff30a6ae04d737ce9063ccfd5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.24/zemacs-v0.4.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fc2dd785d67e4f9e40ce3170030cb1132ed5e441880a2417fe349bb8057b43cd"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.24/zemacs-v0.4.24-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b1128410789767e6f5bd33770f7b779cf47171147994dcc62d23a130976cb64a"
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
