class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.3.2/joltc-v0.3.2-aarch64-macos.tar.gz"
      sha256 "62d34e9a3d5bb77efad12451e37e013acded5e528ed5b411d52f028903d7590d"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.3.2/joltc-v0.3.2-x86_64-linux.tar.gz"
      sha256 "685dccf42fa80ae5562269a855a374c926c8d0d6b2e00303a44ba990fc5bcdb5"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
