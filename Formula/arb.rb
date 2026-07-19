class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.0.4"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.4/arb-v0.0.4-aarch64-apple-darwin.tar.gz"
      sha256 "9ac65e98ae84588ca09bd7538bc028275fb258bf9d91083bb83de2317d6bd865"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.4/arb-v0.0.4-x86_64-apple-darwin.tar.gz"
      sha256 "7c801df7b8d1eb50a0103089edf5086d8549056d1f78f620fc5bacd31eead7e9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.4/arb-v0.0.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9427a1dc274dcb79d6409fdba74a6f2fa8716fe68ede38f9365945b94f57f3e1"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.4/arb-v0.0.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9f0bba24eec35a47d08f7c5ce44ceb4c47ee1f39640de677e9dadae28b05ebba"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.0.4-x86_64-unknown-linux-musl.tar.gz  sha256: 242d709f9fecbabe19e5aa82350ce281987bce4f8b0f5f9d1dceda4a2c1bbc6a
  #   arb-v0.0.4-aarch64-unknown-linux-musl.tar.gz  sha256: c9eb5b4d4edef8425f1a10b2ed7160bd6b937a55e42f09959eb5728bca0506d5
end
