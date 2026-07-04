class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.1.4/joltc-v0.1.4-aarch64-macos.tar.gz"
      sha256 "286ccd8feed7a2c8b2acd1c8d02f49bfb2de8d11e2c8ff0f0b263237af73ff28"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.1.4/joltc-v0.1.4-x86_64-linux.tar.gz"
      sha256 "e3bcbf3ae236b9a1595f387be4f8b8ab6bf84481c3d185f59ecf95aee210f72c"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
