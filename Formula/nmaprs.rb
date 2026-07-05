class Nmaprs < Formula
  desc "Parallel network scanner with nmap-compatible CLI (Rust)"
  homepage "https://github.com/MenkeTechnologies/nmaprs"
  license "MIT"
  version "0.1.9"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/nmaprs/releases/download/v0.1.9/nmaprs-v0.1.9-aarch64-apple-darwin.tar.gz"
      sha256 "561264daa696342b7a60f2691c7664b453259cc464fb00bfbb7499d3239c8bf4"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/nmaprs/releases/download/v0.1.9/nmaprs-v0.1.9-x86_64-apple-darwin.tar.gz"
      sha256 "b7ce3023cbaef9dd57f40dc765a38ff1367c78bf0749a6f397a29b21d79f7cf9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/nmaprs/releases/download/v0.1.9/nmaprs-v0.1.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "89d18e5b1ea59fca8132f944a54f987ee28099dc15e231b9579d399867087936"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/nmaprs/releases/download/v0.1.9/nmaprs-v0.1.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0dda1a31e96c3c4bb8bc7859f292f2ac98578210597067f7792b8a47af16540f"
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
