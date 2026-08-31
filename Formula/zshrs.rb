class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.55"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.55/zshrs-v0.12.55-aarch64-apple-darwin.tar.gz"
      sha256 "5e10fce9de0beb55b492596c44cb57e969def8b2f90a09e2050b6cf51c97e025"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.55/zshrs-v0.12.55-x86_64-apple-darwin.tar.gz"
      sha256 "571bb078f5e67236a8f1ed618c54609bac2c7164d654cfefc4afe464f0c1a4cf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.55/zshrs-v0.12.55-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "687fbbb918e1ddfde60124361ad9e5a61ad753a427e53cc890211e7955d32070"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.55/zshrs-v0.12.55-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5812b636e6cac2f6537005452a72c8ca991bdaac1023a507f5bc0a930a94a1f0"
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
  #   zshrs-v0.12.55-x86_64-unknown-linux-musl.tar.gz  sha256: f282f1a457835b0ae5cf4f65857bf3d331fe0b76d1d6cbfebe722e33ad509b2e
  #   zshrs-v0.12.55-aarch64-unknown-linux-musl.tar.gz  sha256: c6a93694539cfa9193e878c05cf8851f54812c00f31b9874b743c30378594804
end
