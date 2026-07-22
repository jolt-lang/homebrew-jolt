class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.14/joltc-v0.4.14-aarch64-macos.tar.gz"
      sha256 "7f5476c80eb7eac29fa2ce9292bd54621f091e4cca0d646f6dfeff281aa34562"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.14/joltc-v0.4.14-x86_64-linux.tar.gz"
      sha256 "4c87cc8b3a0f9614af177e9d1816c7ff63c5ee1d97b829095cef7fdfa52929f5"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
