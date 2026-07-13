class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.27"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.27/zemacs-v0.4.27-aarch64-apple-darwin.tar.gz"
      sha256 "bed917fd2253e6bc72f28a7e62bb710ca352eb69f1c59d8964a756fd37df9f1a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.27/zemacs-v0.4.27-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0a49fb80fb378a730488191dcc08c99b7e00fca8a61508758d2ca049a636bbea"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.27/zemacs-v0.4.27-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "32e479a6f3a79369c160d8e2b8253639e81a342381a1e908a13a84d3b989f038"
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
