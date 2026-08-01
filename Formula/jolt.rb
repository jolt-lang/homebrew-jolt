class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.16/jolt-v0.5.16-aarch64-macos.tar.gz"
      sha256 "50a794bbcff4dbf2da6f3d1f6787866c317bc44ddeaedefdc1e7456ec74d1ed2"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.16/jolt-v0.5.16-x86_64-linux.tar.gz"
      sha256 "2e7e14b43fd96c27313cda1542d9592f631c901886e7ef152e519d7702d2076b"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
