class Grcrs < Formula
  desc "Generic Colouriser — a faithful Rust port of grc"
  homepage "https://github.com/MenkeTechnologies/grcrs"
  license "MIT"
  version "1.13.8"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/grcrs/releases/download/v1.13.8/grcrs-v1.13.8-aarch64-apple-darwin.tar.gz"
      sha256 "aec3d5d3eb7d1ce7f37294268051e765a1d0960afedfb816e21cd0e0ecd09ab0"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/grcrs/releases/download/v1.13.8/grcrs-v1.13.8-x86_64-apple-darwin.tar.gz"
      sha256 "eb3a53acb2d3a6a2b00325fd96ec49adad4b20d34c3b114e4edf4271c10674b2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/grcrs/releases/download/v1.13.8/grcrs-v1.13.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "45652cee8bd010f5cc3e9ddea5aacb4e5e71262c72dc87f19c63307731873a70"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/grcrs/releases/download/v1.13.8/grcrs-v1.13.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c781a61b2093b20561fde2ee9f7ff530a90aaaff4dd253777de817f8684d7a55"
    end
  end

  def install
    bin.install "grc"
    bin.install "grcat"
    etc.install "grc.conf"
    (share/"grc").install Dir["conf.*"]
  end

  test do
    assert_match "Colouriser", shell_output("#{bin}/grc --version")
  end

  # Static musl tarballs also published at this release:
  #   grcrs-v1.13.8-x86_64-unknown-linux-musl.tar.gz  sha256: 6cf72d28d26a5d840f43fcdad82231c54ab4515fe2cb558ef02e19b426c253a6
  #   grcrs-v1.13.8-aarch64-unknown-linux-musl.tar.gz  sha256: 907c0b6aa6dc954935962e98d18f85c7a6c7b0c253b4aa7cce49e803eab7a039
end
