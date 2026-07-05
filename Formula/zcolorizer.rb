class Zcolorizer < Formula
  desc "Real-time log colorizer (ccze/pygments port) with customizable regex rules"
  homepage "https://github.com/MenkeTechnologies/zcolorizer"
  license "MIT"
  version "0.2.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zcolorizer/releases/download/v0.2.2/zcolorizer-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "fd97fb54fbeed7b06d67961b17fe215d06825047f5d03094519c6a413e3d8b88"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zcolorizer/releases/download/v0.2.2/zcolorizer-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "2503981c124bc267c621a431bd4c69ab7a751d293065d071266d17d48b7216af"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zcolorizer/releases/download/v0.2.2/zcolorizer-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "38a80a62a6305809ae03f31e454630f873f5a3c29183423f02d3f365d34fe157"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zcolorizer/releases/download/v0.2.2/zcolorizer-v0.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "51ab5384cb032b1725fb9550cb67413518f5632aba2e32bfc30f84a1ee5f724f"
    end
  end

  def install
    bin.install "zcolorizer"
  end

  test do
    assert_match "zcolorizer", shell_output("#{bin}/zcolorizer --version")
  end

  # Static musl tarballs also published at this release:
  #   zcolorizer-v0.2.2-x86_64-unknown-linux-musl.tar.gz  sha256: c6913c2244d777ad91b08c04f35a35d63a2d4b4bbfb5f0ca64279886a613bf86
  #   zcolorizer-v0.2.2-aarch64-unknown-linux-musl.tar.gz  sha256: e79a8f22c948200cbf1a875d74bb9b7f72e1a951e88512e17c7345cc17e1a4d3
end
