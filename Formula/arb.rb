class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.1.5"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.5/arb-v0.1.5-aarch64-apple-darwin.tar.gz"
      sha256 "b7b2da716485e244f7e7bc8b3d93856ba4329a9b70d8d549885602adb139982f"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.5/arb-v0.1.5-x86_64-apple-darwin.tar.gz"
      sha256 "2a59814163dc5f63b063eeea3320b0b222c5698e96f30a051e1eb2c6fad8d7aa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.5/arb-v0.1.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "086e53c5f3c5f6fd629b37fe259076368d7e94be29786cad4fc95ab85b4e44b5"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.5/arb-v0.1.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b005dfab4a466d7817db481217a9b02ff84ff1a7f99ec3d602a5a2799d7a07cf"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.1.5-x86_64-unknown-linux-musl.tar.gz  sha256: 6d081b69bc9e5e60e9aeb7ecbd8e4cf437edaffec96b573eb2c2d70d065ef563
  #   arb-v0.1.5-aarch64-unknown-linux-musl.tar.gz  sha256: 6d01b756b0792d9cb97f47e5e096949d6554a20867da743776473e94eeabee52
end
