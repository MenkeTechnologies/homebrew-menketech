class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.32"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.32/zshrs-all-v0.13.32-aarch64-apple-darwin.tar.gz"
      sha256 "38a4a1fed3209332e054708aa8c9e4b5a6dac309abf50e68b87623f7060bad8c"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.32/zshrs-all-v0.13.32-x86_64-apple-darwin.tar.gz"
      sha256 "263ab52e7e160c018f3395b768cae4fd44a5d01434c97833e77d381a9f49c9e8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.32/zshrs-all-v0.13.32-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c52d8125e317f2922673e9dd5226c841948d7a121d80b8c5e5ee24a5822e0daa"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.32/zshrs-all-v0.13.32-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "90ebb26cc31a2d11a2d813ceac2ed9af3907ad1ad57b18c0868171c49c6e5d80"
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
  #   zshrs-all-v0.13.32-x86_64-unknown-linux-musl.tar.gz  sha256: 692424805a2fc46c01de7369356294bb7671ccd0184ba88616b31cdabb83ef0a
end
