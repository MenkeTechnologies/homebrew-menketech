class Powerliners < Formula
  desc "1:1 Rust port of powerline-status — daemon + client + config + render + lint"
  homepage "https://github.com/MenkeTechnologies/powerliners"
  license "MIT"
  version "0.2.12"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.12/powerliners-v0.2.12-aarch64-apple-darwin.tar.gz"
      sha256 "dbde4c7ef305c490686f0f658b235efaed461f7873b1e6f136d75ccd0e9de4c5"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.12/powerliners-v0.2.12-x86_64-apple-darwin.tar.gz"
      sha256 "985c906d9ba42bd59de38b3ce72a8e6ad0b725ac9766516055dfe5ee59ed6c76"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.12/powerliners-v0.2.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d8ace62730839222f909330795434f6a7146fdbdeab60c209a79e1992090b775"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.12/powerliners-v0.2.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3311abc69a3601505e81f34fa0faaa8e8e67b144de7a4baf5bf4aba04a3f0b4e"
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
  #   powerliners-v0.2.12-x86_64-unknown-linux-musl.tar.gz  sha256: 3aec318e165a4803b651af72e7d06e316b3c45f66698f0255c31fe2358e3bdc6
  #   powerliners-v0.2.12-aarch64-unknown-linux-musl.tar.gz  sha256: 06d8885919e2dc2b6d35d895b976cf8ce4f59e6cc9f817a6ac42e6e02ccbff92

  # Per-binary tarballs also published — see release page for sha256:
  #   https://github.com/MenkeTechnologies/powerliners/releases/tag/v0.2.12
end
