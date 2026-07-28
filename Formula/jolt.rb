class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.10/jolt-v0.5.10-aarch64-macos.tar.gz"
      sha256 "09ce7dc73beef7a396f54bcaaaf7a23130452593923b7ccf2c8c881944133b8d"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.10/jolt-v0.5.10-x86_64-linux.tar.gz"
      sha256 "8b29e88ddcd40bff386ced9ec8fe92bfbb5b145068ffaffe09611e48387e0bba"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
