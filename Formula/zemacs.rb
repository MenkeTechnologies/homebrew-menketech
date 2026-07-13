class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.28"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.28/zemacs-v0.4.28-aarch64-apple-darwin.tar.gz"
      sha256 "c5bfc0b696de8d641ed498cde687ae67fb6e486989aa65df7f5fee44f162d958"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.28/zemacs-v0.4.28-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "80ce815f4a504803a050e3e584f315cc5da4e0cb9ec4b03bb4b9ee57d97e079e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.28/zemacs-v0.4.28-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "712ed3e57ba74d2af18496f419615d4af15677977d3e1fae82e1a0b5023555eb"
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
