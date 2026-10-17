class ZwireHost < Formula
  desc "Local IPC host: system stats, filesystem, exec, PTY and kv store"
  homepage "https://github.com/MenkeTechnologies/zwire-host"
  license "MIT"
  version "0.3.24"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.24/zwire-host-v0.3.24-aarch64-apple-darwin.tar.gz"
      sha256 "efb324a7e4c2bd37d04df35d5a8d1f027747e885a60356d84f3a2fd650de741b"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.24/zwire-host-v0.3.24-x86_64-apple-darwin.tar.gz"
      sha256 "d0c126b374a6d285e66424d512bd8cf1ee6acf2107a17c3a1bc101a955aca8db"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.24/zwire-host-v0.3.24-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fa18a6d99160f7237d4d5f38d7492722ae7e971d89711f99bf3c9d040e74d2e1"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.24/zwire-host-v0.3.24-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "13a18ec5b652f0a7df8b3d850477e625045dbaf09eea005480072d567c3eda7f"
    end
  end

  def install
    bin.install "zwire-host"
  end

  test do
    assert_match "zwire-host", shell_output("#{bin}/zwire-host --version")
  end
end
