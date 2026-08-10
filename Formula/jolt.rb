class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.6.9/jolt-v0.6.9-aarch64-macos.tar.gz"
      sha256 "24583c1553d3de91fa6df79d4ef70261f28b73b174f4f07a73627374220c5e0c"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.6.9/jolt-v0.6.9-x86_64-linux.tar.gz"
      sha256 "73b06beafc6ff36d4e8058c3ab9f1118ad73e506bc247f48114517a7635509b2"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
