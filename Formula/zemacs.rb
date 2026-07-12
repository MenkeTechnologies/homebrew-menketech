class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.17"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.17/zemacs-v0.4.17-aarch64-apple-darwin.tar.gz"
      sha256 "cbcb98092c440377c64ac02ecbd628e116768ee97e81b41d14139fa3e94f342a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.17/zemacs-v0.4.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f3d96a9ad896753bfdb329bebc49b9b446a90ae03d09d85a5a739bf1c9faa51"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.17/zemacs-v0.4.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "62198899bac955873a3faf4ea27ac887d90bf1a3e05c05f9c2ad6386ff9d54d8"
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
