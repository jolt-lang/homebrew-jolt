class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.3/joltc-v0.4.3-aarch64-macos.tar.gz"
      sha256 "002d7666e37a962c8811a506bdb866cfe460ff79cc12a7978df3cd2378123db0"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.3/joltc-v0.4.3-x86_64-linux.tar.gz"
      sha256 "e18c4ac9c1bb8c4e34c4338f83046111c807588f4549a37d3a69fea7d7b2997d"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
