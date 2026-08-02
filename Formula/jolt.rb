class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.20/jolt-v0.5.20-aarch64-macos.tar.gz"
      sha256 "0f3bf49432d967cae6509be44c5dd00e6acac8ff6b50396271ec9ec4c05a8c4c"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.20/jolt-v0.5.20-x86_64-linux.tar.gz"
      sha256 "aa8b4e8a831f5216aa9499cfdcaa151133b4e14ac30f23bc3410114f6d2f989d"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
