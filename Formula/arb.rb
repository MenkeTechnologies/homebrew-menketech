class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.0.3"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.3/arb-v0.0.3-aarch64-apple-darwin.tar.gz"
      sha256 "e181c41006421dc5e3b4a7143dd109a6ca279c81559477f92afa051da5d5d34c"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.3/arb-v0.0.3-x86_64-apple-darwin.tar.gz"
      sha256 "c3ca7400fb8f9ec9a85ba123ccd60f9b266cf9b16efd273aa1af29807596116b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.3/arb-v0.0.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e7553c85a6790e369c768eefa9227e51355f0cc37c1b9c7ba611fbc78e8e49fe"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.0.3/arb-v0.0.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6e6aeaeeca5c2aff21e3b6448dbccce1e45c3638a54293310721aa0d4f9c5d1a"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.0.3-x86_64-unknown-linux-musl.tar.gz  sha256: 7185bd5aa818cb7b420265f4a20141ad2a16201e93ee30c6c89fa5180c9c4217
  #   arb-v0.0.3-aarch64-unknown-linux-musl.tar.gz  sha256: 2f1d8d19355050f48a932f007b989948dccc1b93de72d5ea625ff30d2e35840e
end
