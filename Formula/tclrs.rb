class Tclrs < Formula
  desc "Tcl compiled to fusevm bytecode — a parser and compiler, no bespoke VM or JIT"
  homepage "https://github.com/MenkeTechnologies/tclrs"
  license "MIT"
  version "0.4.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.1/tclrs-v0.4.1-aarch64-apple-darwin.tar.gz"
      sha256 "ed093f0ca9a5a83031d9ec2252de1541d0be4422e58a34269c4a618fde6be61c"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.1/tclrs-v0.4.1-x86_64-apple-darwin.tar.gz"
      sha256 "a8d5016826a845da116f462eb8843a2c142fe420a3f938b3fcd7f6d7b1d6e0dc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.1/tclrs-v0.4.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "734b2a8ffb7593c1182a4528f1ef95dd6a720dc7210dd6daeed36beb41f4db98"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.1/tclrs-v0.4.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e0ea6c03af33773ba6653ab5d50ce43fe3f7233456461f6f84f8f1d7749ab384"
    end
  end

  def install
    bin.install "tclrs"
  end

  test do
    assert_match "tclrs", shell_output("#{bin}/tclrs --version")
    assert_equal "3", shell_output("#{bin}/tclrs -c \x27puts [expr {1+2}]\x27").strip
  end

  # Static musl tarballs also published at this release:
  #   tclrs-v0.4.1-x86_64-unknown-linux-musl.tar.gz  sha256: 9e5d6d744ba48f0fa5fd1bfdffe342170082bb3b3b7610cb657af1aa855f547e
  #   tclrs-v0.4.1-aarch64-unknown-linux-musl.tar.gz  sha256: 6d3020c3b5855a18280506e56adced37e9ac354ef02343931b666de54f3e38d3
end
