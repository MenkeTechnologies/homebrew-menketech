class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.1.20"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.20/arb-v0.1.20-aarch64-apple-darwin.tar.gz"
      sha256 "f8e1b6429b1246800c60c0da023093bd4323bfa34a60b41d93b0cc58d4c39633"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.20/arb-v0.1.20-x86_64-apple-darwin.tar.gz"
      sha256 "1d9d1e37ed49c1580c8dc4c8d30ec4123af8cfcb701c0fc5cf37910c6be0d14e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.20/arb-v0.1.20-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ddb66a4008764d518f53b08156cee2e1a00f1becdcd003cf1a9fa1b4d4fd30f4"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.20/arb-v0.1.20-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6d19937424632d147241ef8472b01f8d87c58f938f91c97f9c33b57430e82f6d"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.1.20-x86_64-unknown-linux-musl.tar.gz  sha256: 2cb04b8a695a3e3ad26484f8c30c483eb0a757efc05bc7bd3cd321eb3d333a04
  #   arb-v0.1.20-aarch64-unknown-linux-musl.tar.gz  sha256: fffc477b40ca78234023cda0166c934128eca9a2b879852e72ddad54ea54c4a7
end
