class ZwireHost < Formula
  desc "Local IPC host: system stats, filesystem, exec, PTY and kv store"
  homepage "https://github.com/MenkeTechnologies/zwire-host"
  license "MIT"
  version "0.3.8"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.8/zwire-host-v0.3.8-aarch64-apple-darwin.tar.gz"
      sha256 "48f838f742b0679b22753aeeccb0d16cd0d246ca4d7ef790907d55f40d999655"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.8/zwire-host-v0.3.8-x86_64-apple-darwin.tar.gz"
      sha256 "d7d1c73cecf9e993f5bacb3bab276933e4f4e1bd68c504116b635dd0235e4c81"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.8/zwire-host-v0.3.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "55bdf8f26f9e163c305f465f22292ef86eed6e842accc31cdbbddd849c43cea9"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.8/zwire-host-v0.3.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2981e1c038493150311160d69b07d7c1c72a9fb5542e87fbbf970134023c4a54"
    end
  end

  def install
    bin.install "zwire-host"
  end

  test do
    assert_match "zwire-host", shell_output("#{bin}/zwire-host --version")
  end
end
