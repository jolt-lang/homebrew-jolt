class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.14/jolt-v0.7.14-aarch64-macos.tar.gz"
      sha256 "314152ad43d40f9132f3fa72970f1768f3e0a182264c9e8faf759c04164eecc4"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.14/jolt-v0.7.14-x86_64-linux.tar.gz"
      sha256 "2fc92b4cb7c1325b23768146a08566123de12967204739a3ec0cdcdea4cb7d28"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
