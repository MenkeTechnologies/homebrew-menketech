class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.16"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.16/zemacs-v0.4.16-aarch64-apple-darwin.tar.gz"
      sha256 "61226fd174a6c72bc327fac1e5f413444bc35bdf59b7aa48bed081da958e4d80"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.16/zemacs-v0.4.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4c8b0550a161882a627ad1e56ce994339528971c6d6ad897e78e051d3fbbe16e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.16/zemacs-v0.4.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d4ab1b3a0731466163657b303e5eee99b89c00942ceb36497c17b9fbb310ae74"
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
