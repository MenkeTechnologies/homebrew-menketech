class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.84"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.84/zshrs-v0.13.84-aarch64-apple-darwin.tar.gz"
      sha256 "ee03e86c1e090f3d55a1ee71e6ffe65be0ee0890d914675f88f8191b2ae7e3dc"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.84/zshrs-v0.13.84-x86_64-apple-darwin.tar.gz"
      sha256 "786e4edd08cd9c9a71cf5510f4d6c6f62b1925696331f7c0a4385d9621fa5bb1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.84/zshrs-v0.13.84-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "47268804c1fb275d8cc0fbca92be3d2818911c06bd81fba0ec371e8e104d9c0b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.84/zshrs-v0.13.84-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9e3e7d7b4099b5141c938b16515e23e23206155b8a4ec1f64d0a0628c5156dac"
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
  #   zshrs-v0.13.84-x86_64-unknown-linux-musl.tar.gz  sha256: 0ae93711a313e31e86004cab6218dc400f47b81d715fdccbbddf1989a12030cd
  #   zshrs-v0.13.84-aarch64-unknown-linux-musl.tar.gz  sha256: ed27c8b059fdef83f8c2ba51a1df8fd3b7efc576333898ffc57cbd18169ade8b
end
