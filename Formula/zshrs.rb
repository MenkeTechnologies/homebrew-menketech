class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.44"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.44/zshrs-v0.13.44-aarch64-apple-darwin.tar.gz"
      sha256 "4b2b25f3841ea18321f947cca457e9ead649f4a244d488a2100fcefa6302b605"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.44/zshrs-v0.13.44-x86_64-apple-darwin.tar.gz"
      sha256 "31ada390a33662b195c0a61af27c9419a14b423ea71d9c4876d6c30a46180146"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.44/zshrs-v0.13.44-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a532c0806c0079d7accba865c84af4d39983924c0b2317523269c2efce6768c2"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.44/zshrs-v0.13.44-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ebba474d4000ce7fc9cfdeeaffe300767d58cd60b125cd3f57da0c05c741697a"
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
  #   zshrs-v0.13.44-x86_64-unknown-linux-musl.tar.gz  sha256: 9d8d611b4ca4a618e70b87ca0eb921a086734d057c0393fdbb3c7cb8870bf267
end
