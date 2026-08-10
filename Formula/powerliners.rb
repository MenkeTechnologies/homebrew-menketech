class Powerliners < Formula
  desc "1:1 Rust port of powerline-status — daemon + client + config + render + lint"
  homepage "https://github.com/MenkeTechnologies/powerliners"
  license "MIT"
  version "0.2.23"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.23/powerliners-v0.2.23-aarch64-apple-darwin.tar.gz"
      sha256 "c91f20af2a2231570dd8e721ebfacc2611ec9a337ad1cacf7d8c74ae3096d662"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.23/powerliners-v0.2.23-x86_64-apple-darwin.tar.gz"
      sha256 "b8b746687cb8fdfe1457243ccb4d22c6fa19527688ca9282022cef56aeef59af"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.23/powerliners-v0.2.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4ffa3ccfb4740de6df91a54fe1ca77c71b674fe6129abac580928e9ad5fb8d17"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.23/powerliners-v0.2.23-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9e75865abbae617bcc983d802492874a0c1764506c2e2c31a2bae757b3c83848"
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
  #   powerliners-v0.2.23-x86_64-unknown-linux-musl.tar.gz  sha256: f0f64115d8313f8512756534c193d48c54ddebdd4a337e57cffef6f8d4d95b31
  #   powerliners-v0.2.23-aarch64-unknown-linux-musl.tar.gz  sha256: 6920b1bd5ae416c546ec77467ae4030ef23419adaa10593b0353a06c64e692cb

  # Per-binary tarballs also published — see release page for sha256:
  #   https://github.com/MenkeTechnologies/powerliners/releases/tag/v0.2.23
end
