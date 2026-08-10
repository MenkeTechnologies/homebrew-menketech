class Powerliners < Formula
  desc "1:1 Rust port of powerline-status — daemon + client + config + render + lint"
  homepage "https://github.com/MenkeTechnologies/powerliners"
  license "MIT"
  version "0.2.22"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.22/powerliners-v0.2.22-aarch64-apple-darwin.tar.gz"
      sha256 "0f5d76a7573252d578478733e2d888db9efd687d11c429cacab996ea748726cf"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.22/powerliners-v0.2.22-x86_64-apple-darwin.tar.gz"
      sha256 "8f23520b11a4dfa274dd06445c0919b0ff06b7b30f2eb7fd08109a419a207357"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.22/powerliners-v0.2.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "49fbb28baf756872f8b04ccfcd36e8b05d8fd996d55fc1c01a69c85d0b3d49c9"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.22/powerliners-v0.2.22-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f695d2f08654c9f645ba611020a66410815fda5ec89b26b1d5662c2ecdcf2fd9"
    end
  end

  def install
    bin.install "powerline"
    bin.install "powerline-daemon"
    bin.install "powerline-config"
    bin.install "powerline-render"
    bin.install "powerline-lint"
  end

  test do
    assert_match "ext is required", shell_output("#{bin}/powerline-render 2>&1", 2)
  end

  # Static musl tarballs also published at this release:
  #   powerliners-v0.2.22-x86_64-unknown-linux-musl.tar.gz  sha256: de1453f62638331c3d7a83cabd23a25d32706fcfa3a5771277ed960a2d71d6e8
  #   powerliners-v0.2.22-aarch64-unknown-linux-musl.tar.gz  sha256: 8ad2ab2b083d40ecdd6311c0408f11509453c93ef04970b95081a9179b962baf

  # Per-binary tarballs also published — see release page for sha256:
  #   https://github.com/MenkeTechnologies/powerliners/releases/tag/v0.2.22
end
