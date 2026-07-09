class ZwireHost < Formula
  desc "Local IPC host: system stats, filesystem, exec, PTY and kv store"
  homepage "https://github.com/MenkeTechnologies/zwire-host"
  license "MIT"
  version "0.3.10"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.10/zwire-host-v0.3.10-aarch64-apple-darwin.tar.gz"
      sha256 "a78b4975df84d05da1eef99a8619353275f69be8ea4a410d3a6f4aed27fcd1c5"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.10/zwire-host-v0.3.10-x86_64-apple-darwin.tar.gz"
      sha256 "c3e008f3bb159f68f4a60152d760744c7c68aeae61c5ead9397a0293f353c20a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.10/zwire-host-v0.3.10-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "52682de31550b3b1243ae3859321e68a4f1184d01c1f7154a80a21782852ec8c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.10/zwire-host-v0.3.10-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "56e071b91e4ad1a9bf13ca2f6646e8929716d4bfdde29214be6c23991b3b2758"
    end
  end

  def install
    bin.install "zwire-host"
  end

  test do
    assert_match "zwire-host", shell_output("#{bin}/zwire-host --version")
  end
end
