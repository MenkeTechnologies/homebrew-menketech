class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.64"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.64/zshrs-v0.13.64-aarch64-apple-darwin.tar.gz"
      sha256 "7d756ad4d049645ffd7762706bc374ab8500db69914d3991cd544b33dbf2c0a7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.64/zshrs-v0.13.64-x86_64-apple-darwin.tar.gz"
      sha256 "8c3dee1296a24f0fe167f715b7e521e19b2cbdae84bf92df65676e382a27ed82"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.64/zshrs-v0.13.64-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "15dff2375c8b1c90139a00c4f737969406902bf5d1302a5ce8e480e9b203ca51"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.64/zshrs-v0.13.64-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4d7ed8bf48060b0d8c0f9983db4c656b609526a24d84a343ebd4ba27719c6cb2"
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
  #   zshrs-v0.13.64-x86_64-unknown-linux-musl.tar.gz  sha256: ad59597bae2ad4dac042d15d9b0c9e102252717a292bc74efa3124008194008c
end
