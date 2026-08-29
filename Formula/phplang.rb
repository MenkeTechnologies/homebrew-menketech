class Phplang < Formula
  desc "Compiled PHP runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/phplang"
  license "MIT"
  version "0.2.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.1/phplang-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "0d8f7ebea398dd561ed84541fb07e40e4840a8f80ac6de6c545ed6072e9a66ff"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.1/phplang-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "c1a2c1ab164f504960f5ef800d6bdcb64edcd1d456aecea8353fdf965cac6d2c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.1/phplang-v0.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "817b276b9b884274a412f13e4479421341450e0fd1c0c123a8c427ce52b04226"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/phplang/releases/download/v0.2.1/phplang-v0.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2811aa77295f9566686119d9c6b823469a655d06ef3944adcfbfdffe9fca271a"
    end
  end

  def install
    bin.install "php"
  end

  test do
    assert_match "42", shell_output("#{bin}/php -r 'echo 6*7;'")
  end

  # Static musl tarballs also published at this release:
  #   phplang-v0.2.1-x86_64-unknown-linux-musl.tar.gz  sha256: 001e935d9aa7db7be3417a948cf05a06f16755106189c7baa8dbc1c8439fffb2
  #   phplang-v0.2.1-aarch64-unknown-linux-musl.tar.gz  sha256: c8d26ef6771f33a4f3ceaea268c92d832691ee90fa80cd16dfde804642bfb73c
end
