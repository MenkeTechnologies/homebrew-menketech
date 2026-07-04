class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.2.18"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.18/zemacs-v0.2.18-aarch64-apple-darwin.tar.gz"
      sha256 "9fcf550adbc59e5483983af4127a512afd124b8a1d13afa067803469da04f304"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.18/zemacs-v0.2.18-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "73733ba67b8e498506f35871c5f3581498f5a3a9f8aa78d8ddabce663fb3a1c7"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.18/zemacs-v0.2.18-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "90566551620a1e0a38087b01730298cb467be88d18fa39986dfc17a99c8c89f6"
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
