class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.70"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.70/zshrs-v0.13.70-aarch64-apple-darwin.tar.gz"
      sha256 "3318e060a9b334f25d9fea018b28dfda592681382feaeaae247ab33328e3bd50"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.70/zshrs-v0.13.70-x86_64-apple-darwin.tar.gz"
      sha256 "919d984e2f1cc3364c890e44f195da24677cbd0121ea61d1919ff0edc8ea1951"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.70/zshrs-v0.13.70-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "520516a75aa965623c3295b0c34d1a9d5060aecfccb0bda2342401a20655b31c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.70/zshrs-v0.13.70-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f3b349a2f2b7f460341dccd0ab69bb75c093b2c94e0f74104f414032a12d3bb6"
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
  #   zshrs-v0.13.70-x86_64-unknown-linux-musl.tar.gz  sha256: 9b143c6bbb9d126f6c09243286b2438b6af4c1dfb9d9eda78da99e505f942a74
end
