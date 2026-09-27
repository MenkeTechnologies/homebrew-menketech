class Pythonrs < Formula
  desc "Compiled Python runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/pythonrs"
  license "MIT"
  version "0.1.13"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/pythonrs/releases/download/v0.1.13/pythonrs-v0.1.13-aarch64-apple-darwin-bundled.tar.gz"
      sha256 "81fb562274ca6a1b5dc82e6b319ec2ebceeee004317a7716d4b630223c24fe7a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/pythonrs/releases/download/v0.1.13/pythonrs-v0.1.13-x86_64-unknown-linux-gnu-bundled.tar.gz"
      sha256 "1f469a78fd851a0345fcd85e0311542be575018ad25a753b76fb83766708d5f2"
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
