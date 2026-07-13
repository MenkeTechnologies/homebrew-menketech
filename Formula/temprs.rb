class Temprs < Formula
  desc "Temporary file stack manager — atomic flock-protected master record"
  homepage "https://github.com/MenkeTechnologies/temprs"
  license "MIT"
  version "2.9.13"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/temprs/releases/download/v2.9.13/temprs-v2.9.13-aarch64-apple-darwin.tar.gz"
      sha256 "32d05178ae112f31073397ee7245a71d2fbbf9b1bf14f95a7a63056d1b43c5aa"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/temprs/releases/download/v2.9.13/temprs-v2.9.13-x86_64-apple-darwin.tar.gz"
      sha256 "eb8d99e000611ed8c866da2baa5cd695c1d2e02bd1685dc6f81f15b612bb35cf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/temprs/releases/download/v2.9.13/temprs-v2.9.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "10fdf66f2a95258e687b93b980f68857492cf7fed4e8ff967d5ee54211f7bd29"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/temprs/releases/download/v2.9.13/temprs-v2.9.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d4893548b6cc6f615482094b06fde15591afbd8d06e96ac5d243af0f2dc35985"
    end
  end

  def install
    bin.install "temprs"
    bin.install "tp"
  end

  test do
    assert_match "temprs", shell_output("#{bin}/temprs --version")
  end

  # Static musl tarballs also published at this release:
  #   temprs-v2.9.13-x86_64-unknown-linux-musl.tar.gz  sha256: b9ac4ef7e7a32b4365280757fe69043b21cd897189e74969f03a3b2548aeef7d
  #   temprs-v2.9.13-aarch64-unknown-linux-musl.tar.gz  sha256: 38888de487b178476ba9aa1b51b4fa9cf79a3364731d3592390eb468b223ab48
end
