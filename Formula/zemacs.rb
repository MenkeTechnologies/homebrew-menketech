class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.2.22"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.22/zemacs-v0.2.22-aarch64-apple-darwin.tar.gz"
      sha256 "66f9ff8898f51c74bcc862aa0d00e5e4ba87f3604a951f1e5a96adca6e5fab25"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.22/zemacs-v0.2.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8af43d7c7a22673fc9480139eb1abd4d5d55084217a18fb7f3c9c07e6d0aaa52"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.22/zemacs-v0.2.22-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "95e0ad5a80616eae2b07d9f7fe0f6e325d21530c06bb423c2abade0faa447192"
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
