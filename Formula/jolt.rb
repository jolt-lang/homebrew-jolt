class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.15/jolt-v0.5.15-aarch64-macos.tar.gz"
      sha256 "69adb2ffeebd354d5b0d2f4ca8cdbe362466c7f2946830a1c274b0ec4b9dc698"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.15/jolt-v0.5.15-x86_64-linux.tar.gz"
      sha256 "7cd666e9c3c4f1f1778f18736319c5ab48c654fc83690ee4f72849d65cc39e42"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
