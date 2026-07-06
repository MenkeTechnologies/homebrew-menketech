class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.4.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.1/zemacs-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "45e283320172e1a549d3c4707229089f51fab0b2b69349c8a2909ed80467895d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.1/zemacs-v0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "930926fdd17a41b60884cd8159afe49a00858a5189e77fc57b11e147253e3bb5"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.4.1/zemacs-v0.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2fb1faf0b601afb9ccf778cc1d186ffb06b8e17be90e447f6593f6ad5eada211"
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
