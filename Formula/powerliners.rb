class Powerliners < Formula
  desc "1:1 Rust port of powerline-status — daemon + client + config + render + lint"
  homepage "https://github.com/MenkeTechnologies/powerliners"
  license "MIT"
  version "0.2.32"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.32/powerliners-v0.2.32-aarch64-apple-darwin.tar.gz"
      sha256 "f5c477e9b3b8720b9bac44e06c7dcbaf3d6b34bb792edcc4a618e4223f697157"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.32/powerliners-v0.2.32-x86_64-apple-darwin.tar.gz"
      sha256 "04c63e92e9ec0beed5f102558a055fe1ef2a605f167e3a47f68f40927ec7968d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.32/powerliners-v0.2.32-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "55774b0a7d6007a6a5450ae945fc145e0fd3e637ad531b24db235429bb0b4e8b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.32/powerliners-v0.2.32-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f0d0743a7846381167d225ae3683c3229b61c789de552e99857c561ca1f3c846"
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
  #   powerliners-v0.2.32-x86_64-unknown-linux-musl.tar.gz  sha256: dee60c76e46e9b52f4209e793b08001e0d8f530b42901c45944c815dae43ee3f
  #   powerliners-v0.2.32-aarch64-unknown-linux-musl.tar.gz  sha256: b988f7f7a583b9943ef854229b235d18bec4f2d395b6ffb6e3dc0b5addc2cca5

  # Per-binary tarballs also published — see release page for sha256:
  #   https://github.com/MenkeTechnologies/powerliners/releases/tag/v0.2.32
end
