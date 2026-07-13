class ZwireHost < Formula
  desc "Local IPC host: system stats, filesystem, exec, PTY and kv store"
  homepage "https://github.com/MenkeTechnologies/zwire-host"
  license "MIT"
  version "0.3.15"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.15/zwire-host-v0.3.15-aarch64-apple-darwin.tar.gz"
      sha256 "967bf788bbb8d5bbcb79a9b27138a6bc262f72d4fb0b525e584c69f1c8ef7a3a"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.15/zwire-host-v0.3.15-x86_64-apple-darwin.tar.gz"
      sha256 "a52c36533eda8c4715e689fe5bee23eb285e065b6baad84332a994b81a18a5e9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.15/zwire-host-v0.3.15-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5e4e48207ecfbb33b2558184633fe61691e5ac733a8e06cea753bb10c836fe2b"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.15/zwire-host-v0.3.15-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e8d514953d05fb81c86be267ee9abca5292ec16d47f98c8e0c8bc66bed4c8795"
    end
  end

  def install
    bin.install "zwire-host"
  end

  test do
    assert_match "zwire-host", shell_output("#{bin}/zwire-host --version")
  end
end
