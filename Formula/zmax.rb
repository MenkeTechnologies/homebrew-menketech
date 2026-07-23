class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.39"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.39/zmax-v0.4.39-aarch64-apple-darwin.tar.gz"
      sha256 "00bd4f72f2935685045dd3255ec7175973b8ea053f7709b7c79cc0d0e5414fe8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.39/zmax-v0.4.39-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c2423b1c83c92bf18a1bf0078213acb29ad1aefb92d7857f6e19640b7f75ad33"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.39/zmax-v0.4.39-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "63541d59447a890fb89201181d7f12024713d147e8e2bb50fc92d9f0086e7c82"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"zmax"
  end

  test do
    assert_match "zmax", shell_output("#{bin}/zmax --version")
  end
end
