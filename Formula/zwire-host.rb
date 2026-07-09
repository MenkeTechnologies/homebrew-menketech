class ZwireHost < Formula
  desc "Local IPC host: system stats, filesystem, exec, PTY and kv store"
  homepage "https://github.com/MenkeTechnologies/zwire-host"
  license "MIT"
  version "0.3.9"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.9/zwire-host-v0.3.9-aarch64-apple-darwin.tar.gz"
      sha256 "589a2fada15baf8742d47415eca9f660094071230063f8ff2c34d98a473370b6"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.9/zwire-host-v0.3.9-x86_64-apple-darwin.tar.gz"
      sha256 "c069e773bbc932e457161f90b0af86344eaec2ef1d13653558f1f8784650518a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.9/zwire-host-v0.3.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1d8786e5c642d54fc7feb0264077dfac75da677e3325da2305f869125edae6de"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.9/zwire-host-v0.3.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "57f76ab9823f12be3b3370f10493a587b603960bd8a4062d7f982b7e6a7d63ef"
    end
  end

  def install
    bin.install "zwire-host"
  end

  test do
    assert_match "zwire-host", shell_output("#{bin}/zwire-host --version")
  end
end
