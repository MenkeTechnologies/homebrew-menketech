class Pythonrs < Formula
  desc "Compiled Python runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/pythonrs"
  license "MIT"
  version "0.1.11"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/pythonrs/releases/download/v0.1.11/pythonrs-v0.1.11-aarch64-apple-darwin-bundled.tar.gz"
      sha256 "fc34a67f35fdfc1c9d0b3d3df7173083805a8ed67b7bc0c54d2f0592e291bf4e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/pythonrs/releases/download/v0.1.11/pythonrs-v0.1.11-x86_64-unknown-linux-gnu-bundled.tar.gz"
      sha256 "02bac4eaff003747d19e7f08a3f58a94dac9a024e1f833b6b88b7fb4d66ecdae"
    end
  end

  def install
    libexec.install "bin", "lib"
    bin.install_symlink libexec/"bin/python"
  end

  def post_install
    home = File.expand_path("~/.pythonrs")
    mkdir_p home
    ["bin", "lib"].each do |d|
      rm_rf "#{home}/#{d}"
      cp_r "#{libexec}/#{d}", home
    end
  end

  test do
    assert_equal "42", shell_output("#{bin}/python -c 'print(6*7)'").strip
    (testpath/"t.py").write("import hashlib\nprint(hashlib.sha256(b'x').hexdigest()[:8])\n")
    assert_equal "2d711642", shell_output("#{bin}/python #{testpath}/t.py").strip
  end
end
