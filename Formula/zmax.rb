class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.74"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.74/zmax-v0.4.74-aarch64-apple-darwin.tar.gz"
      sha256 "05997c70b8ef5982604db77e0704a22c43d707e465204b9be4f328ef7148cbee"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.74/zmax-v0.4.74-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2604f1a0cded5e5da81ab5797f4359e29fe65d21709342436f86e14f6b077f5e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.74/zmax-v0.4.74-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "421c333e3439b1db36b6b774435ed884cfd082e8dfd3447221cfe6b9b567e8f0"
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
