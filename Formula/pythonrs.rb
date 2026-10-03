class Pythonrs < Formula
  desc "Compiled Python runtime on the fusevm bytecode VM + Cranelift JIT"
  homepage "https://github.com/MenkeTechnologies/pythonrs"
  license "MIT"
  version "0.1.14"

  on_macos do
    on_arm do
      url "https://github.com/MenkeTechnologies/pythonrs/releases/download/v0.1.14/pythonrs-v0.1.14-aarch64-apple-darwin-bundled.tar.gz"
      sha256 "faf1fd0f7ac060ace16ae9da10c44b7ec2f9531b5af59e5d0e7544dd244d5798"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/MenkeTechnologies/pythonrs/releases/download/v0.1.14/pythonrs-v0.1.14-x86_64-unknown-linux-gnu-bundled.tar.gz"
      sha256 "0fcc0904870bfb4b6f7c4419b6927f1ea9dff7d32aa1aa95ee168387ade105eb"
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
