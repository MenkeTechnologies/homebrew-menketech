class ZwireHost < Formula
  desc "Local IPC host: system stats, filesystem, exec, PTY and kv store"
  homepage "https://github.com/MenkeTechnologies/zwire-host"
  license "MIT"
  version "0.3.12"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.12/zwire-host-v0.3.12-aarch64-apple-darwin.tar.gz"
      sha256 "ccb121627623bdbd73365f36e2d05217b3696002cf1897d5e95471784095a055"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.12/zwire-host-v0.3.12-x86_64-apple-darwin.tar.gz"
      sha256 "453d2554625da0441c34d8d367d1a212d5a9b7f305af09bf50a47c4d5e568a14"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.12/zwire-host-v0.3.12-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ccacd4e21c8501fb3a360e78294a4a75fc805c59c4455752a38d1474f4b76113"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.12/zwire-host-v0.3.12-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cf23dbd633600f091f176cb276a24fd6a356880ab5521fcee7a79a4ac61e6251"
    end
  end

  def install
    bin.install "zwire-host"
  end

  test do
    assert_match "zwire-host", shell_output("#{bin}/zwire-host --version")
  end
end
