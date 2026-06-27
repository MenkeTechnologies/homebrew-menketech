class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps on the Helix engine"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.1.0/zemacs-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "1989ef8a6b8f9747b1e7baa3de99d907127d69445ba5833a575c24b99fd489ca"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.1.0/zemacs-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "f73688c7f4f92e130c598a38f9fb6a260f4bc4478c559dbdb7d97bb95c85c783"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.1.0/zemacs-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ce9e7c03cd095fac355c9c666141f383001c8b5407a7091fd931cff92223a504"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.1.0/zemacs-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "59561840c08e7b29032dcfb6c7396b24bf55b403e007f8d4a100005100500a3a"
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
