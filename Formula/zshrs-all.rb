class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.3/zshrs-all-v0.13.3-aarch64-apple-darwin.tar.gz"
      sha256 "80c7166c3b9b8a3858ee3143be1db50c6f1f970a1c032dba1d85a63b023cccfc"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.3/zshrs-all-v0.13.3-x86_64-apple-darwin.tar.gz"
      sha256 "1e366b48220b1897fda55a0f9ab54b2366a1a09ce76f438977f3b851c42b620e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.3/zshrs-all-v0.13.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8788d06ae43b120dab40aa9e5c5b896aed4387825ca9e709964cc59ea68bc976"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.3/zshrs-all-v0.13.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "02e31ec2c4ab3faee017c678369d74b89e496abdcfb34b77b0f9cb8d1cdda0eb"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
    bin.install "zshrs-recorder"
    bin.install "zshrs-daemon"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
    assert_predicate bin/"zshrs-recorder", :exist?
    assert_predicate bin/"zshrs-daemon", :exist?
  end

  # Static musl tarballs also published at this release:
  #   zshrs-all-v0.13.3-x86_64-unknown-linux-musl.tar.gz  sha256: 67ff42db9540e74039b9baafd25127d905d6014c0989cd78b31f719c87f4a4bf
  #   zshrs-all-v0.13.3-aarch64-unknown-linux-musl.tar.gz  sha256: 4ee8e4045a8d142b7e618490d126edc1cb008681baa33be2d7599e2d59993dde
end
