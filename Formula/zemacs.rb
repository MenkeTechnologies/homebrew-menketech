class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.13"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.13/zemacs-v0.4.13-aarch64-apple-darwin.tar.gz"
      sha256 "3d5325e04e593be42c101659b98fdaf8b5237d1f96eb91ea52a7f946aca7aff7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.13/zemacs-v0.4.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f637a6e8a9dfe8836001ead8145d01c0efe1bd9c9f9877ab4871454b68e2c065"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.13/zemacs-v0.4.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e6ca73d3b19fd4687c7b9f6a1e4982d84981e0ed4a429236f357d216bd2fa28d"
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
