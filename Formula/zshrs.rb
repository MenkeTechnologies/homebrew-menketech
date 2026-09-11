class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.62"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.62/zshrs-v0.12.62-aarch64-apple-darwin.tar.gz"
      sha256 "ec0f5cefcd63ce47194df808c96c897b03d4031be55b80b6527ab90740b07580"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.62/zshrs-v0.12.62-x86_64-apple-darwin.tar.gz"
      sha256 "de5718879f4489abfa0bf7cd472e2243f1f7806f902912d900cb408fb228b87d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.62/zshrs-v0.12.62-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5a79632d5cf941d702337d550aeae4559bba053bebab2e71f2e2e179c876c0f4"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.62/zshrs-v0.12.62-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5d0ae86e47da9a0401478fa9e62068bf4fa4109bf987ac8087dbc40483f5ac46"
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
  #   zshrs-v0.12.62-x86_64-unknown-linux-musl.tar.gz  sha256: ba498f2406b4d13da5b2d12b3995c3cab84cfd312e6ee93521ee12678b180a4a
  #   zshrs-v0.12.62-aarch64-unknown-linux-musl.tar.gz  sha256: e0f08dd94878770a41a0b3d91b0dd89a95acf1e50a1abef16122a38c8104d219
end
