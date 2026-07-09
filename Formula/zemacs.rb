class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.6"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.6/zemacs-v0.4.6-aarch64-apple-darwin.tar.gz"
      sha256 "9bd3c7d871d0d129d72d2b61d49f576827954ba3c1131ef49bff658e1286f98a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.6/zemacs-v0.4.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c810724275043f2b75d6cf64d712d844033512f479ccb067307b6de3634c72c1"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.6/zemacs-v0.4.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "af0012ca43c56cd38496b41ea2983dbabd67e4da907aeba1dd0f2595fff9a8a7"
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
