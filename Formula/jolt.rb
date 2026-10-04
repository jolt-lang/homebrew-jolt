class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.17/jolt-v0.8.17-aarch64-macos.tar.gz"
      sha256 "5e323df0974244099d57dd36b0f96e04962f14e097d15d579141027183acc2f9"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.17/jolt-v0.8.17-x86_64-linux.tar.gz"
      sha256 "d524d6176f94c1a5d2ef46998c6c1bd2c7eaa3e46b130f55c0e3e6f864aca70d"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
