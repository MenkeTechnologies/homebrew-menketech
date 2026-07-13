class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.25"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.25/zemacs-v0.4.25-aarch64-apple-darwin.tar.gz"
      sha256 "6d28ef6fe4ee5ad7e9c51fdee7a6cd00afd81833ab85916afba40a0fe0bf9a79"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.25/zemacs-v0.4.25-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f8613b833e4e87f05127b17fa9d04443da3d6a7ffb81738a8c43c78238f09ce2"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.25/zemacs-v0.4.25-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a29a7981395323dc7e72558d4068a1990d6e4fd7254dfb5e3a9609d94295c905"
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
