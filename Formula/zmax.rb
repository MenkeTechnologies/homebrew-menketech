class Zmax < Formula
  desc "Modal text editor in Rust — vim/emacs keymaps"
  homepage "https://github.com/MenkeTechnologies/zmax"
  license "MPL-2.0"
  version "0.4.38"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.38/zmax-v0.4.38-aarch64-apple-darwin.tar.gz"
      sha256 "7f13a1a55df358979c629373487ef56bd717a9d931611f3ece6ddd4049c9a226"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.38/zmax-v0.4.38-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3a8c96b3b849a993ce3888b7842a6e12983f202a7d5098aee4438611e14cfcc8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zmax/releases/download/v0.4.38/zmax-v0.4.38-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7e4abc5296a24d31cdddc425b8b69fb0d93e0e24a0f5f9fd49b771d106e25bfd"
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
