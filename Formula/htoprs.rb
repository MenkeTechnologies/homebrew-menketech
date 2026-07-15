class Htoprs < Formula
  desc "Interactive process viewer — a faithful Rust port of htop"
  homepage "https://github.com/MenkeTechnologies/htoprs"
  license "MIT"
  version "0.5.9"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.9/htoprs-v0.5.9-aarch64-apple-darwin.tar.gz"
      sha256 "eabeb5b75e3d56100b88b7d889a10383d8f594c202ef65832ee321cca97fb1a7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.9/htoprs-v0.5.9-x86_64-apple-darwin.tar.gz"
      sha256 "abd382fff3dfa3886ad403b55e679079356c5a9a294ef1cd330e26d0a6b40fa2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.9/htoprs-v0.5.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "76e4436a3febb296e7467e431561f926b10ac8175ef5cd05d526f76a10031ec3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/htoprs/releases/download/v0.5.9/htoprs-v0.5.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9d6e44e2d21df6d1baaa0eed9c5b5ac6093828e9ff1ef07dedb257609e50ae9b"
    end
  end

  def install
    bin.install "htoprs"
  end

  test do
    assert_match "htoprs", shell_output("#{bin}/htoprs --version")
  end
end
