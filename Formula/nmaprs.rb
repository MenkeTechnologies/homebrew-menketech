class Nmaprs < Formula
  desc "Parallel network scanner with nmap-compatible CLI (Rust)"
  homepage "https://github.com/MenkeTechnologies/nmaprs"
  license "MIT"
  version "0.1.3"

  on_macos do
  on_arm do
    url "https://github.com/MenkeTechnologies/nmaprs/releases/download/v0.1.3/nmaprs-v0.1.3-aarch64-apple-darwin.tar.gz"
    sha256 "0d305f3bf7b15a0a7c245f4b8db532af4312651bd286d54aacc60528b76d1b91"
  end
  on_intel do
    url "https://github.com/MenkeTechnologies/nmaprs/releases/download/v0.1.3/nmaprs-v0.1.3-x86_64-apple-darwin.tar.gz"
    sha256 "96144e5b275f0cf3be4430c7a92f7d44c24c9b67aa63baa4a955e87c86eddd3b"
  end
  end

  on_linux do
  on_intel do
    url "https://github.com/MenkeTechnologies/nmaprs/releases/download/v0.1.3/nmaprs-v0.1.3-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "eaf07034e521496d57895a065f3d9a7c132f91b16a32653c040485274ce74247"
  end
  end

  def install
  bin.install "nmaprs"
  bin.install "nms"
  end

  test do
    assert_match "nmaprs", shell_output("#{bin}/nmaprs --version")
  end
end
