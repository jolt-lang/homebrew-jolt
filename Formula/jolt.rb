class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.3/jolt-v0.8.3-aarch64-macos.tar.gz"
      sha256 "ef70f96c238061390e5099ddc188293edb2c5868bbc19e9019a929b038fa2d97"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.3/jolt-v0.8.3-x86_64-linux.tar.gz"
      sha256 "e567297a6a840d9988a1aa082beb430aeaa0e6610a82a6f9ee0564e117745147"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
