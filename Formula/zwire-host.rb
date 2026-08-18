class ZwireHost < Formula
  desc "Local IPC host: system stats, filesystem, exec, PTY and kv store"
  homepage "https://github.com/MenkeTechnologies/zwire-host"
  license "MIT"
  version "0.3.16"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.16/zwire-host-v0.3.16-aarch64-apple-darwin.tar.gz"
      sha256 "13d0842cd6079ac817151e5119e20a1243a33df9647489f29b27de39a05f1506"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.16/zwire-host-v0.3.16-x86_64-apple-darwin.tar.gz"
      sha256 "c350e00633999e012bfe99a9abd333daaf1d97eeca0419b24bf6086da57e3dbb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.16/zwire-host-v0.3.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4f41f55537822dd376e3cbde39e1115500a12ad60a29e43c647745949032c55d"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.16/zwire-host-v0.3.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ed716b2d455b9ec0d90677bc3c8e7d63b2bdb0822629f10c07396537ee27d6b5"
    end
  end

  def install
    bin.install "zwire-host"
  end

  test do
    assert_match "zwire-host", shell_output("#{bin}/zwire-host --version")
  end
end
