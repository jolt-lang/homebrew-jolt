class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.3.0/joltc-v0.3.0-aarch64-macos.tar.gz"
      sha256 "17dbc902316f9183e7a4b91f4f6252de3bd3620011b0dca3ba3c7d7b60f0a29c"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.3.0/joltc-v0.3.0-x86_64-linux.tar.gz"
      sha256 "0cf64c919cc28ae2794536a913ada9f15503941f22f5a92a76c2d56dec31f6db"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
