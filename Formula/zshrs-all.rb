class ZshrsAll < Formula
  desc "Full zshrs install — shell + zd client + recorder + daemon"
  homepage "https://github.com/MenkeTechnologies/zshrs"
  license "MIT"
  conflicts_with "zshrs", because: "both install zshrs and zd"
  version "0.13.26"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.26/zshrs-all-v0.13.26-aarch64-apple-darwin.tar.gz"
      sha256 "287ef8b83f15d39335320638c235c0cfe13887b39287500773ebdfb24775f584"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.26/zshrs-all-v0.13.26-x86_64-apple-darwin.tar.gz"
      sha256 "dae155f12a7e27d272dda013872ba8a758be1970e116c864ba464445b69e6335"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.26/zshrs-all-v0.13.26-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9cad9f435b647093b1babe45a3142d143e7588adc69925ddefb817f48519ab62"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/zshrs/releases/download/v0.13.26/zshrs-all-v0.13.26-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0441dc909ff5033fba90b1772a475e3b48fbecf52d88ecd894b4da1996445355"
    end
  end

  def install
    bin.install "zshrs"
    bin.install "zd"
    bin.install "zshrs-recorder"
    bin.install "zshrs-daemon"
  end

  test do
    assert_match "hi", shell_output("#{bin}/zshrs -c 'echo hi'")
    assert_predicate bin/"zshrs-recorder", :exist?
    assert_predicate bin/"zshrs-daemon", :exist?
  end

  # Static musl tarballs also published at this release:
  #   zshrs-all-v0.13.26-x86_64-unknown-linux-musl.tar.gz  sha256: df22e895fa8c61ef68ce3f0f9fb5114929650fc7047fbeb68b0c1a07e504bee4
end
