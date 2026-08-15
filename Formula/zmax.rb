class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.55"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.55/zmax-v0.4.55-aarch64-apple-darwin.tar.gz"
      sha256 "c76c98f5eecd1db58eb7181acafc4129ce10a6184778fbc479950c8626b243fb"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.55/zmax-v0.4.55-x86_64-apple-darwin.tar.gz"
      sha256 "2ddac43e762b60a1594287ad7614f543caf881ff66d6e2b86ef5e4291a2a65d0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.55/zmax-v0.4.55-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "69ce31c848ac06b8c62c01221175968f518bf5b175445ea14f4c6994cefcce91"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.55/zmax-v0.4.55-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c366be3ea5d0c4e5249c38f03411f93b606b41130431ca047124f130f4616c81"
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
