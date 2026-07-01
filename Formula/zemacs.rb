class Zemacs < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zemacs"
  license "MPL-2.0"
  version "0.2.8"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.8/zemacs-v0.2.8-aarch64-apple-darwin.tar.gz"
      sha256 "5b1a091b5cb7593458d955749b3b865df7e41f6f9a5ea16ca8708783f2808280"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.8/zemacs-v0.2.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "98a6f4abdf78f447ec88cf8e84900d1158b171b6a503e62250014d5aa5913273"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zemacs/releases/download/v0.2.8/zemacs-v0.2.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8448c02faba477ef06984aa2d2a605946ba7c0d357bb264d127a997e78acacd6"
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
