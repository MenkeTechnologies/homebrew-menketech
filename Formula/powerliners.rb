class Powerliners < Formula
  desc "1:1 Rust port of powerline-status — daemon + client + config + render + lint"
  homepage "https://github.com/MenkeTechnologies/powerliners"
  license "MIT"
  version "0.2.19"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.19/powerliners-v0.2.19-aarch64-apple-darwin.tar.gz"
      sha256 "ba5754ff07ad5306f1532a16900cca806fd33aa10b8429cd56b13b05e906b956"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.19/powerliners-v0.2.19-x86_64-apple-darwin.tar.gz"
      sha256 "a7008f2efe6c3efbd3513a968c9f8d45efca01801045455a663cf6eed6e87d76"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.19/powerliners-v0.2.19-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "75ae05a3bfe32896dfc91e2eb7e9280588435f81e0fc9c67391f97304761822f"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/powerliners/releases/download/v0.2.19/powerliners-v0.2.19-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "087805da8e7d0c37b650b9dfe2d93f0c6321d334cb31f469da17d9610c9064fa"
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
  #   powerliners-v0.2.19-x86_64-unknown-linux-musl.tar.gz  sha256: 7dcfd869fa4f4ecf268967c93d14d7737f217685b5697be21eb18d6dcaebdd60
  #   powerliners-v0.2.19-aarch64-unknown-linux-musl.tar.gz  sha256: 3ef5d70286c99e45ead5f40181de4ecdb6e25df3f69a197134da8dda89a864bf

  # Per-binary tarballs also published — see release page for sha256:
  #   https://github.com/MenkeTechnologies/powerliners/releases/tag/v0.2.19
end
