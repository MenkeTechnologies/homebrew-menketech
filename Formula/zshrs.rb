class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.6"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.6/zshrs-v0.13.6-aarch64-apple-darwin.tar.gz"
      sha256 "12aa2114c5f2a45c65283004b5732bb55dfc394495689fba4271835d47ecd22a"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.6/zshrs-v0.13.6-x86_64-apple-darwin.tar.gz"
      sha256 "2f867743405ec51a8d03c40122ee76f9b00ca8c071f4af01b1ff31db4d1aa023"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.6/zshrs-v0.13.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "26caee3a72a0f8837558c80be0d700fe4378d50d689b96bc68f14436eb6610a7"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.6/zshrs-v0.13.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ccff4aec59e2fa623fa1e4830da5bbe3438925281105b519bb89e1cc8f5c0392"
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
  #   zshrs-v0.13.6-x86_64-unknown-linux-musl.tar.gz  sha256: 3b84b93eea89a39e3fce47638338f90e916c746072c3d4756eeef6db8a237633
  #   zshrs-v0.13.6-aarch64-unknown-linux-musl.tar.gz  sha256: 00660d52bad7e6d29de53c220f0dedaecc4a4ebbc6816fe3da2018951b4d919e
end
