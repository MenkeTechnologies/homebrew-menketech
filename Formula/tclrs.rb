class Tclrs < Formula
  desc "Tcl compiled to fusevm bytecode — a parser and compiler, no bespoke VM or JIT"
  homepage "https://github.com/MenkeTechnologies/tclrs"
  license "MIT"
  version "0.4.9"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.9/tclrs-v0.4.9-aarch64-apple-darwin.tar.gz"
      sha256 "5e67f3fcae1275bcb03f1b3a615ec576f98c67054bd4906ab41dcfd53223d109"
    end
    on_intel do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.9/tclrs-v0.4.9-x86_64-apple-darwin.tar.gz"
      sha256 "c456516f5710b53762444bd975b2f4a393e342c10eacc97641a2018c2b457182"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.9/tclrs-v0.4.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7ffd441cca6f08e54e982b3c777316ac631358235b02ef27fa675ee901df2564"
    end
    on_arm do
      url "https://github.com/MenkeTechnologies/tclrs/releases/download/v0.4.9/tclrs-v0.4.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8cf6f2091c72a220637aadbf7bc4f9178de56e1b5a999e7c66a1e8142a1a70f8"
    end
  end

  def install
    bin.install "tclrs"
  end

  test do
    assert_match "tclrs", shell_output("#{bin}/tclrs --version")
    assert_equal "3", shell_output("#{bin}/tclrs -c \x27puts [expr {1+2}]\x27").strip
  end

  # Static musl tarballs also published at this release:
  #   tclrs-v0.4.9-x86_64-unknown-linux-musl.tar.gz  sha256: 71235ec6deba68cfc064e5c8b8f1f3497b116c7b0f99d740f8c635b0527a1eb3
  #   tclrs-v0.4.9-aarch64-unknown-linux-musl.tar.gz  sha256: bda22b077d912ceef09282fd60c6dd91d8911f9b1d9f12df1de2878f3f5df4a4
end
