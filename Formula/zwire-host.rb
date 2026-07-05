class ZwireHost < Formula
  desc "Local IPC host: system stats, filesystem, exec, PTY and kv store"
  homepage "https://github.com/MenkeTechnologies/zwire-host"
  license "MIT"
  version "0.3.1"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.1/zwire-host-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "fe7968a53ba694d67bd80d323db2f65bba04ac18aa5ee6221a80a45fd1b53c52"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.1/zwire-host-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "b28b8002b6cd05ab4a3c9c55928c5159b549339724f545f0267e3fb29cdb57b2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.1/zwire-host-v0.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f5bfdd6ea5315bbd1ee209d7b49a83315610ccc550169adee8a1ab488e3b86c3"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.1/zwire-host-v0.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1cb7a44f0b9b6c62245a8fe93b932a4a3c954d850b5d962486fc76f44a8c8557"
    end
  end

  def install
    bin.install "zwire-host"
  end

  test do
    assert_match "zwire-host", shell_output("#{bin}/zwire-host --version")
  end
end
