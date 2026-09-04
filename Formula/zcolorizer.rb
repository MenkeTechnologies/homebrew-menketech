class Zcolorizer < Formula
  desc "Real-time log colorizer (ccze/pygments port) with customizable regex rules"
  homepage "https://github.com/MenkeTechnologies/zcolorizer"
  license "MIT"
  version "0.2.9"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zcolorizer/releases/download/v0.2.9/zcolorizer-v0.2.9-aarch64-apple-darwin.tar.gz"
      sha256 "bbc8d58a850b3cde5d1c7d87b67f2815b2a1e9db1f64b7d9f29050e72990fe24"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zcolorizer/releases/download/v0.2.9/zcolorizer-v0.2.9-x86_64-apple-darwin.tar.gz"
      sha256 "43aef141b01d1a00d72cecddb4ed13a77ded46a7ccda7518155b234ca5af8407"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zcolorizer/releases/download/v0.2.9/zcolorizer-v0.2.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "32880a34fb7d3850668b46659604f389dae5dd7133044ca3913e1090ababfa15"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zcolorizer/releases/download/v0.2.9/zcolorizer-v0.2.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0f5a60e7e9cb17437ce12b0f237f34586363c1b403ac5bb360681a526cfb8180"
    end
  end

  def install
    bin.install "zcolorizer"
  end

  test do
    assert_match "zcolorizer", shell_output("#{bin}/zcolorizer --version")
  end

  # Static musl tarballs also published at this release:
  #   zcolorizer-v0.2.9-x86_64-unknown-linux-musl.tar.gz  sha256: 161761e7bae6f8f73da5daa57f4caecbd0f16f0cf0fdfaa3d2e4e5a023d17d79
  #   zcolorizer-v0.2.9-aarch64-unknown-linux-musl.tar.gz  sha256: 832605a55347c57581740de6877e8e18b6cb49609ce023efc4f57834988a8b21
end
