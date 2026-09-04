class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.12.58"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.58/zshrs-v0.12.58-aarch64-apple-darwin.tar.gz"
      sha256 "7f8eb4bee52b397e682b9d077dce2f56c3ecf690ab2627b438da827110c3e215"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.58/zshrs-v0.12.58-x86_64-apple-darwin.tar.gz"
      sha256 "91b28a3eeb7ebbf19b50f359545f137828ebcabe7bd63b9b2cfff343fd93613e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.58/zshrs-v0.12.58-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3051035fe158dabbc3fcbf2127301584e796f753259e398de67a1c9d1933394b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.12.58/zshrs-v0.12.58-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "39776f1b9609319798f35fe9741af3b184f032d68090f8acfae0161a7de4a992"
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
  #   zshrs-v0.12.58-x86_64-unknown-linux-musl.tar.gz  sha256: 361c00a1a9fa53c655bfbda4aec039ec372193fadcbb8ba10cacc0c3d5a10865
  #   zshrs-v0.12.58-aarch64-unknown-linux-musl.tar.gz  sha256: 69a42f5da8adcb0415fb6efc725ff64b9fc9b9c4f72362cdbc00278873d5adca
end
