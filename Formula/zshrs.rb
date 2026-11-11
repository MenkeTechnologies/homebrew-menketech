class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.62"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.62/zshrs-v0.13.62-aarch64-apple-darwin.tar.gz"
      sha256 "b73b4220ad6bccc1e726a86d4ccfd3cb9d70954ff83f655490589673e4ac5e20"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.62/zshrs-v0.13.62-x86_64-apple-darwin.tar.gz"
      sha256 "dcde29627173ef0dc3d911b7596cec020c6a8c44d706777340c4936b953a75fc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.62/zshrs-v0.13.62-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "33743a6160bd07bdd0167179a2e40356a65c04bd702dbab2fb48068109ae83bd"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.62/zshrs-v0.13.62-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9c0ee39fa979d53138924b51b20aa483d6a4e77bfdd77a4606233d2884e053af"
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
  #   zshrs-v0.13.62-x86_64-unknown-linux-musl.tar.gz  sha256: 74ee309d62356fc7d1eea2b5d497bc417572952f2c4bb2703c6b539fbf4f23cc
end
