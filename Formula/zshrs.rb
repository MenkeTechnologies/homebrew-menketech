class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.11.47"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.47/zshrs-v0.11.47-aarch64-apple-darwin.tar.gz"
      sha256 "4b2d375bf88b30624a9b16d6ac41ea674b85a5ff82b36ace3ff3b1122e8fd1ff"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.47/zshrs-v0.11.47-x86_64-apple-darwin.tar.gz"
      sha256 "5e3a772adbba9983ffa1335f30b0b1c10581c206b982ea70fcaa7337fca96fde"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.47/zshrs-v0.11.47-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "00c680502867e2f9db6adc46d907ca467c866334ca01fe429d59d62cae1166e3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.11.47/zshrs-v0.11.47-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a3fabc481236b560b0269cb4f06ee90677e793535f3c4ca2e930830edcf29139"
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
