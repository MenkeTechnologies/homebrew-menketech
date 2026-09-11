class Arb < Formula
  desc "Visualize and modify Unix pipelines — a dynamic TUI for every pipeline"
  homepage "https://github.com/MenkeTechnologies/arb"
  license "MIT"
  version "0.1.17"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.17/arb-v0.1.17-aarch64-apple-darwin.tar.gz"
      sha256 "890b1b0cf616cc14d362d7603b1f79b02694a051a109dc165dfa5570be8c7679"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.17/arb-v0.1.17-x86_64-apple-darwin.tar.gz"
      sha256 "560c57585151abd18c828f7cd1d58cccd554867d47fa01f49a2801b4a7437b41"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.17/arb-v0.1.17-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2990ad35a3e3d06bde50b5f94bc464042baa88ee721e501bd40cacafc76de061"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/arb/releases/download/v0.1.17/arb-v0.1.17-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6b20b7aa6f59e4d1eae1dc79c534c626503f3519be31644ba0beeee163371628"
    end
  end

  def install
    bin.install "arb"
  end

  test do
    assert_match "arb", shell_output("#{bin}/arb --version")
  end

  # Static musl tarballs also published at this release:
  #   arb-v0.1.17-x86_64-unknown-linux-musl.tar.gz  sha256: 0ff20f1906b63ac53fdcdaf3d1a30a15ba58fe7b4a2c146899f20dd1a0c4ca90
  #   arb-v0.1.17-aarch64-unknown-linux-musl.tar.gz  sha256: 07695595679412724e94a731445be2641ade7e2e9b6852c4a682621ef8f4e9be
end
