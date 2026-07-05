class ZwireHost < Formula
  desc "Local IPC host: system stats, filesystem, exec, PTY and kv store"
  homepage "https://github.com/MenkeTechnologies/zwire-host"
  license "MIT"
  version "0.3.2"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.2/zwire-host-v0.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "4147bc1424b37983ec4b87e8e88fc1d69a81ec2429d806c41c0dcef034ed57c7"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.2/zwire-host-v0.3.2-x86_64-apple-darwin.tar.gz"
      sha256 "38681a970a2615694c0956c9f0263b00cfbb58cef00a80f67b3e856f8920aa04"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.2/zwire-host-v0.3.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3ac7b0a8ba83492afb939a1da500e4f0cbf397cc17ca9824c7f067b3aefb5fb2"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zwire-host/releases/download/v0.3.2/zwire-host-v0.3.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aa5aa3a049fa313f2e8ca6f9fca4d8737e6be918eb60b65f4a62b813cb863564"
    end
  end

  def install
    bin.install "zwire-host"
  end

  test do
    assert_match "zwire-host", shell_output("#{bin}/zwire-host --version")
  end
end
