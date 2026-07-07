class ZwireHost < Formula
  desc "Local IPC host: system stats, filesystem, exec, PTY and kv store"
  homepage "https://github.com/MenkeTechnologies/zwire-host"
  license "MIT"
  version "0.3.4"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.4/zwire-host-v0.3.4-aarch64-apple-darwin.tar.gz"
      sha256 "33fc4205115d7a4eac87d0b75418f19d7910c31a9cf6fa3258ff50f9d6c7ca8e"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.4/zwire-host-v0.3.4-x86_64-apple-darwin.tar.gz"
      sha256 "26b7fdbc6d12584a3be3734d84665c9dc6b21a525dac63ce6b212414e0c889bc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.4/zwire-host-v0.3.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "60e98e3eb5917aa9d35c68301bd646ab4f3a4179d6a65fab4004daa4f4c2665c"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.4/zwire-host-v0.3.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1c2ba096382a4e51554fe65d5ed3932b70e0455f7604a95dac44602c3f100f19"
    end
  end

  def install
    bin.install "zwire-host"
  end

  test do
    assert_match "zwire-host", shell_output("#{bin}/zwire-host --version")
  end
end
