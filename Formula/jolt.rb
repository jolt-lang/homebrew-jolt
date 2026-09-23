class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.11/jolt-v0.8.11-aarch64-macos.tar.gz"
      sha256 "762add50c51f5815d4fa487093e8cb4db4b5c761dde11b3ef2816bf754968b96"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.11/jolt-v0.8.11-x86_64-linux.tar.gz"
      sha256 "6472d7ff32926299e0f750412ad15d6a90e0b56f1d91c1c2695d41e64f2a6efb"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
