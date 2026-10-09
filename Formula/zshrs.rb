class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.20"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.20/zshrs-v0.13.20-aarch64-apple-darwin.tar.gz"
      sha256 "65215bd253d9dc3f71c4b2d0450ad398eedaf90b6130610475b17bf4ee5f3a29"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.20/zshrs-v0.13.20-x86_64-apple-darwin.tar.gz"
      sha256 "f5485f78602e1f75e5ff5ceb814ee99cadb300e7ba708728504ab69da374bfe5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.20/zshrs-v0.13.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0d1cefd615caef1265440d7851aec3444626aab8608bd25d08ae14ad938dbdf6"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.20/zshrs-v0.13.20-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "df2315cc6d1352889993a043cd32295f9d80e94e2672e7185a5435d8698ff1b8"
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
  #   zshrs-v0.13.20-x86_64-unknown-linux-musl.tar.gz  sha256: bb166603e7d82dfa4c340d9c9b819e05d88687e8b3710a2d2f10dfed832af870
end
