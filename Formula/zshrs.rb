class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.46"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.46/zshrs-v0.13.46-aarch64-apple-darwin.tar.gz"
      sha256 "7bf55acc0111c981a80c1f977a3855480e3ea3b4a848659d594c01b405685c15"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.46/zshrs-v0.13.46-x86_64-apple-darwin.tar.gz"
      sha256 "a2a6ed3d736358d048a797e8bbab9f681f4e1220a237ae21e5c39a85a8119743"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.46/zshrs-v0.13.46-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3f08477a77392e359932a0debeef5d6fd8be7ce36b62688ffd288522fbe4bd51"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.46/zshrs-v0.13.46-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cae403aa865dc5068c833d581fdf1163e95e764ef470a33e4363e35f4eafc82a"
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
  #   zshrs-v0.13.46-x86_64-unknown-linux-musl.tar.gz  sha256: 0f470450c047ffec0e85aa997bf197f47f6202fe9615f9fdd9c2f7b0788fe888
end
