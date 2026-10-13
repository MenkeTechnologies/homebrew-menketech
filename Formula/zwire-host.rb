class ZwireHost < Formula
  desc "Local IPC host: system stats, filesystem, exec, PTY and kv store"
  homepage "https://github.com/MenkeTechnologies/zwire-host"
  license "MIT"
  version "0.3.23"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.23/zwire-host-v0.3.23-aarch64-apple-darwin.tar.gz"
      sha256 "b1a0e4dccfc56687f83172e1913a4e8e02edd2a9ac716322ada8b55c0cf05430"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.23/zwire-host-v0.3.23-x86_64-apple-darwin.tar.gz"
      sha256 "8d55970e0f69dbe42baefe4b0c8a943d30938b619a73306426e07526e09afe40"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.23/zwire-host-v0.3.23-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8e7f0f48b06b3fab136101e0f18df17b4ee96729ed83755ea3e55b1251ae5c6e"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.23/zwire-host-v0.3.23-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a4f36a0c306cf2aeed065fabbb9dbbf8d9189a945053dd295603d52b980e551f"
    end
  end

  def install
    bin.install "zwire-host"
  end

  test do
    assert_match "zwire-host", shell_output("#{bin}/zwire-host --version")
  end
end
