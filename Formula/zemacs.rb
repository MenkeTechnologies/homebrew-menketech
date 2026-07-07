class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.2/zemacs-v0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "55d906412acc8fccef7a9f51e9fd66163027c8a3d3b6ad83c7be398f4ec895ab"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.2/zemacs-v0.4.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0596610392e50a33ed5363d8a434fc638890923523fa33fc1dd52a1dd890ceea"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.2/zemacs-v0.4.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d02ae9d963240680a5978c400f050cb3d9e5b888895fdea4a9c3de6ec905ce91"
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
