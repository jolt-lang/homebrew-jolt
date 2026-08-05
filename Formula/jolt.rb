class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.6.4/jolt-v0.6.4-aarch64-macos.tar.gz"
      sha256 "6ca7d3053ef8fb7269541f1235e4cf43e28fad1d3f90b862866a7eab89a2f163"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.6.4/jolt-v0.6.4-x86_64-linux.tar.gz"
      sha256 "d60a46e32a029e0463d87ebcc78f68a7eb433f95a5b1f1f1c60ca94ee319fe83"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
