class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.27"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.27/zshrs-v0.12.27-aarch64-apple-darwin.tar.gz"
      sha256 "53075035bf32239325f22e039bd0e6dc3b841c9936da89e144fa3f437ec0380d"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.27/zshrs-v0.12.27-x86_64-apple-darwin.tar.gz"
      sha256 "844bf2ea1b057c9342e84dcb28db4519f2b288e0f9a880d589fbfcd77f33e01a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.27/zshrs-v0.12.27-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ef31662a70700a9970e05f6935d063f7b1acc9b3efaa14519435c6b3c4b62f13"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.27/zshrs-v0.12.27-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3a260e971b537ff7db503d06adfb3674e2c064fc407ab643fc3094a6f7bd2425"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
  end
end
