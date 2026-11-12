class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.1.24"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.24/arb-v0.1.24-aarch64-apple-darwin.tar.gz"
      sha256 "3fb5ca203f4184780c2d775f7ca0e86625b550075d95f522ce6a54a1c2cdb421"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.24/arb-v0.1.24-x86_64-apple-darwin.tar.gz"
      sha256 "8924fe232fb987de157dbca72165ffd3a9fbff89fb5f83cf31a45f8b0b660bb7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.24/arb-v0.1.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e0c4a205327b0ea887db31967d20ee4e2883dd21076205c16f5b6669925eaec2"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.24/arb-v0.1.24-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bc089bbf2de5ca90ce87c20541edfbb1de912728b592fa0dc494f6684b41803b"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.1.24-x86_64-unknown-linux-musl.tar.gz  sha256: 4a85ee1499b5481e326718a79954f0c5056e8f5d9df1d9039746f02e57fe4c41
  #   arb-v0.1.24-aarch64-unknown-linux-musl.tar.gz  sha256: 2ee5b5910ba82877e2d1dffbc8d487dc8161270e2338d80f2c3a6c867129c7fb
end
