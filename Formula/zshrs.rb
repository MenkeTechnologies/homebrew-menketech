class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.42"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.42/zshrs-v0.13.42-aarch64-apple-darwin.tar.gz"
      sha256 "60cf98e9aabf081621660b8dc487fcf2d1fae7fe14dca9f7128f30902d478eda"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.42/zshrs-v0.13.42-x86_64-apple-darwin.tar.gz"
      sha256 "1ba5ec8807923831f4d382aaf675434a18868894a474157190fcebb0fc22ca71"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.42/zshrs-v0.13.42-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b978ae5adc8c234adaca5f4773f71fe38def2830130dedd916b21a66ea1f9af3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.42/zshrs-v0.13.42-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a8ba494bc27094b4368e7277488008150a24d9af0f4ba2cc12bbde268e5ab528"
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
  #   zshrs-v0.13.42-x86_64-unknown-linux-musl.tar.gz  sha256: 2b19751e0db8bb50d2eb4a7c76fdcf9e8f57c4e6b08f115922ae068bbf2bb588
end
