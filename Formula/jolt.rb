class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.2/joltc-v0.4.2-aarch64-macos.tar.gz"
      sha256 "fef2358a3e69716850a03ad3ba763769ebf3ae28ba18cfeb9df977b7794abf2b"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.2/joltc-v0.4.2-x86_64-linux.tar.gz"
      sha256 "6b4472027bf473f97841849285d3d8f5ea09e8cc225815440abbea7de63ed14e"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
