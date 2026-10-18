class Zshrs < Formula
  desc "First compiled Unix shell — drop-in zsh with bytecode JIT, AOP, worker pool"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  version "0.13.55"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.55/zshrs-v0.13.55-aarch64-apple-darwin.tar.gz"
      sha256 "b3fa6dc94620b6e5a86a52dcabda7006923770cb76ae81c09dc61614ea7399b3"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.55/zshrs-v0.13.55-x86_64-apple-darwin.tar.gz"
      sha256 "b2f831bc082974a060688061f53be48142bd47c7c72229d382d576d98d202c8d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.55/zshrs-v0.13.55-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2ba9dfa5a4145a2e8a0b26a88302bdf31c770e072b251c7d3a851a67fcb7b6bf"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.55/zshrs-v0.13.55-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "168c17bdfe1c7f4fba2c94ed3effb3f57a359f2fea6401494f9a00b0d4d4dca4"
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
  #   zshrs-v0.13.55-x86_64-unknown-linux-musl.tar.gz  sha256: ce10cf11bc2ff749685bad3579f9d95adba3634f856c3826a82c8574894e8ab5
end
