class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.67"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.67/zshrs-v0.12.67-aarch64-apple-darwin.tar.gz"
      sha256 "d547d0c8e1ab8eb66b2f4a39917bc415061e27bacbf203e1e044fd3a61302abc"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.67/zshrs-v0.12.67-x86_64-apple-darwin.tar.gz"
      sha256 "33dfe3d1a3aa4db635d63f3af2e2fc66a01666115782e16c8f825c07c612c709"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.67/zshrs-v0.12.67-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "de68dff2db5494e52e6c7470d8dc3b2056e67d138355c1a26c78b1806f6281d8"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.67/zshrs-v0.12.67-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cbdd30ef6ad5f42da0068554e9689408499e6e1b268737006a43ef84208c3801"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-v0.12.67-x86_64-unknown-linux-musl.tar.gz  sha256: 7dd97dbb074ec0cf9f276e0c6711d18e4d951efdd2d2dd025097799de51efa06
  #   zshrs-v0.12.67-aarch64-unknown-linux-musl.tar.gz  sha256: 88b292090a39601c392655179769b01361889e68351e718bb9a89204d06b25af
end
