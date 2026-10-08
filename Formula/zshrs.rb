class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.13"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.13/zshrs-v0.13.13-aarch64-apple-darwin.tar.gz"
      sha256 "416477b9992349565290be96950d40c66f86e4c156f07eedeedded9dcde0a844"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.13/zshrs-v0.13.13-x86_64-apple-darwin.tar.gz"
      sha256 "cf95b9d693fe8a24dd46cb02a1e7824134eed68ddb482b5c018419ce0ddf3e0d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.13/zshrs-v0.13.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "79a18863acff188ba4edbc7e844bbc86f583f7cf887c041e41fe4271c0ba8c20"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.13/zshrs-v0.13.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f024bff04b285a36e10e474811104cd8a9340d05e85b09a410023f0347471082"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end

  # Static musl tarballs also published at this release:
  #   zshrs-v0.13.13-x86_64-unknown-linux-musl.tar.gz  sha256: fb2c093f2a6add86c3b61ce7deae5b5e8f02285e86b9febea4a299f01efae7cb
  #   zshrs-v0.13.13-aarch64-unknown-linux-musl.tar.gz  sha256: 1afd61dc3b9b76fbb02a3b5036af21788ac4a3520ffbf2f5d66303a89169329d
end
