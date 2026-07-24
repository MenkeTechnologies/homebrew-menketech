class Zdbview < Formula
  desc "Terminal inspector and read/write editor for rkyv archives and SQLite databases"
  homepage "https://github.com/MenkeTechnologies/zdbview"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.3.0/zdbview-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "17c8bdf601aa01533bf9057370731111da373e9f70a1d361aba3235036dd19e5"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.3.0/zdbview-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "00ab76e99c72fc2c473c7935f4504b87a8de3b4f01f25e48274abdb5ce55a5e3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.3.0/zdbview-v0.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "45ace0f8f4f1ee56fad346aa9e48f1622aadf4837f5b734e3aa7ada2a0d9abb3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zdbview/releases/download/v0.3.0/zdbview-v0.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "96b19d16169a2fa7dff919c122f5d403983b1d05cd4afd28c688fa12a1030493"
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
  #   zdbview-v0.3.0-x86_64-unknown-linux-musl.tar.gz
  #     sha256: 0fbe29f6af6e7fbc1f06497a8ff9bd6d30aba0c51d4a34f3e8f17273d46a4bf1
  #   zdbview-v0.3.0-aarch64-unknown-linux-musl.tar.gz
  #     sha256: 0f9a29a9aa0e8da5f2e705cdb86da7c94bbf6cf9d18895431db79144dd49dca5
end
