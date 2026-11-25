class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.81"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.81/zshrs-v0.13.81-aarch64-apple-darwin.tar.gz"
      sha256 "42be4e5af578d86d6628ad13911bcc73db6124506efd3829faf1a1e554891f54"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.81/zshrs-v0.13.81-x86_64-apple-darwin.tar.gz"
      sha256 "9c017347b079d61820fb814dd174603d22e94b76ceb79bb37256058213957d2f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.81/zshrs-v0.13.81-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9cb4947e13816b3a302f71696d4f8a54e1bb77ef435a8d5d5d701b96cdfd1248"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.81/zshrs-v0.13.81-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7001dcdc5de5a9916f37bfe6df13d802f53c44324cd6bdd9af453dbc8af3da0e"
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
  #   zshrs-v0.13.81-x86_64-unknown-linux-musl.tar.gz  sha256: b4611de157421887894da4af056890638d00c84d04fdde49698874489a275683
  #   zshrs-v0.13.81-aarch64-unknown-linux-musl.tar.gz  sha256: 384f1cefce696079518996e1d96f82272abeb42b463069809549c73e17fb203c
end
