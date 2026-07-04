class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.2.17"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.17/zemacs-v0.2.17-aarch64-apple-darwin.tar.gz"
      sha256 "562d8976840663134d75ce2e0ed9a73a93c18aca2ae3c0ed511b8419039a7845"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.17/zemacs-v0.2.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "db9caba7ba4b06e2b17300b97c9de3a0fe7c038e9a2c9a7d8faa92d8865d7723"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.17/zemacs-v0.2.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c8801f238d86447718d9b0768543a17a396a8849b61f229d12863cbcf3dc2783"
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
