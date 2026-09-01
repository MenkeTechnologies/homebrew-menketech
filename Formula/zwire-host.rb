class ZwireHost < Formula
  desc "Local IPC host: system stats, filesystem, exec, PTY and kv store"
  homepage "https://github.com/MenkeTechnologies/zwire-host"
  license "MIT"
  version "0.3.21"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.21/zwire-host-v0.3.21-aarch64-apple-darwin.tar.gz"
      sha256 "109260634564e19624779c44752fdf5cc1790239ecbcd82d17348d7a97587644"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.21/zwire-host-v0.3.21-x86_64-apple-darwin.tar.gz"
      sha256 "a69c3bc0173b35888abbc9c0209199abdfcb29f3b3d2f7294e4730a0439c629f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.21/zwire-host-v0.3.21-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "20349eb358e1ac31f6fd05f5eff565a9d8b9f3a6e64b76253f09c0f4fd90dc59"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.21/zwire-host-v0.3.21-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "656ffad25bb60983f91c25765b33029897262521edc97b3f9b7c9e82993cf943"
    end
  end

  def install
    bin.install "zwire-host"
  end

  test do
    assert_match "zwire-host", shell_output("#{bin}/zwire-host --version")
  end
end
