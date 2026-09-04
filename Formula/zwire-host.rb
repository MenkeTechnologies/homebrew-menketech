class ZwireHost < Formula
  desc "Local IPC host: system stats, filesystem, exec, PTY and kv store"
  homepage "https://github.com/MenkeTechnologies/zwire-host"
  license "MIT"
  version "0.3.21"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.21/zwire-host-v0.3.21-aarch64-apple-darwin.tar.gz"
      sha256 "c0cb0d650d3afc67de29c47917ec32e3b0d6a870ba42c6a99c48b2d73ed39c90"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.21/zwire-host-v0.3.21-x86_64-apple-darwin.tar.gz"
      sha256 "72c8cc16586d69c17320c4559b5ea1e780455a2d613f1ee71a8498cf51191dfe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.21/zwire-host-v0.3.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cd342c0bd7cebf23082e20dc1ed7b42aa8bafe2e18e8ddd67f74bbc78e5ba894"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.21/zwire-host-v0.3.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "00130d87c5ef8b6d845df576ba04a477faaa9f2ed9b4486a9f1b0543d9c35775"
    end
  end

  def install
    bin.install "zwire-host"
  end

  test do
    assert_match "zwire-host", shell_output("#{bin}/zwire-host --version")
  end
end
