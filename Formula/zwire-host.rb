class ZwireHost < Formula
  desc "Local IPC host: system stats, filesystem, exec, PTY and kv store"
  homepage "https://github.com/MenkeTechnologies/zwire-host"
  license "MIT"
  version "0.3.22"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.22/zwire-host-v0.3.22-aarch64-apple-darwin.tar.gz"
      sha256 "947f9926d6b7f3da0338eb8c3bf9ddf64288c882c785b60aae4a9415d7aec6d1"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.22/zwire-host-v0.3.22-x86_64-apple-darwin.tar.gz"
      sha256 "d092793972d8dd231fa743aacf449af34c20cc53d27c06da9846172a795d4011"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.22/zwire-host-v0.3.22-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "670392ec45e08250bff1a3abd32134dfd7ca56616668d52a5566dce684a3ec83"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.22/zwire-host-v0.3.22-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8691089f96dbfb8ee90dcac0a6d5fb11502b3bd9834e8cbc334c871020227c1a"
    end
  end

  def install
    bin.install "zwire-host"
  end

  test do
    assert_match "zwire-host", shell_output("#{bin}/zwire-host --version")
  end
end
