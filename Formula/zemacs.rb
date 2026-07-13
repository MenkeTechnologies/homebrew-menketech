class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.20"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.20/zemacs-v0.4.20-aarch64-apple-darwin.tar.gz"
      sha256 "de3e7d2090126b630dde5cbfaec8f499e237faf39066a01aab75f7398a7f6e0b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.20/zemacs-v0.4.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "84a772da55117cbb60b75aa17cdc292a8ae9b0bfef5d8642320a8ecc10c86c74"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.20/zemacs-v0.4.20-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "17ee958a0cbaff42ffc3e99ce7fbc3ec928a8d3be469106f176b2ace9f9117fa"
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
