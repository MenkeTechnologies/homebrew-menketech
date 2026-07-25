class Zdbview < Formula
  desc "Terminal inspector and CRUD editor for rkyv archives and SQLite databases"
  homepage "https://github.com/MenkeTechnologies/zdbview"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.9.0/zdbview-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "cd50df1d9586f1233046c8ca4b8b8e660bf5fc5df11d7649e829295892bc2abb"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.9.0/zdbview-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "0f0b00349a283c77c24200bf44630572610dc9b044221706dca32c95ce7f125b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.9.0/zdbview-v0.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "820ce5519341a9129da70a378924a72233f2bc60b21b534717422825baf2e4ae"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.9.0/zdbview-v0.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c5025c12e551cfd090f9c2759bd984cc1a9c7981597301317f4d8a6a0fabc67a"
    end
  end

  def install
    bin.install "zdbview"
    man1.install Dir["man/man1/*.1"]
    zsh_completion.install "completions/_zdbview" => "_zdbview"
  end

  test do
    assert_match "zdbview", shell_output("#{bin}/zdbview --version")
  end

  # Static musl tarballs also published at this release:
  #   zdbview-v0.9.0-x86_64-unknown-linux-musl.tar.gz
  #     sha256: 815bb5a4c16aaa3be8ae2f72e5d08aef7f215f39b8b7d7a40c70f0d1d52d82e0
  #   zdbview-v0.9.0-aarch64-unknown-linux-musl.tar.gz
  #     sha256: 8f0080d777cf41d556dca9f8d97fba5d306458d909756913ebf4f0f8a8f09051
end
