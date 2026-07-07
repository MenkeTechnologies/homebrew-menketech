class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.3/zemacs-v0.4.3-aarch64-apple-darwin.tar.gz"
      sha256 "257a4ded450461ac3c676e6510abc2d61b5cdeabd3303b2b0a8c04d0060e7b16"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.3/zemacs-v0.4.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "af1e913f66eee506de067ae26700489940680ecb171593a077b864fbf430d9c8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.3/zemacs-v0.4.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aab3908a3ac62de714217101b1a9f9f89ed5fa278744700105e90ebbd86aaade"
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
