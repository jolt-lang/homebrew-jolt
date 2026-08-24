class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.24/jolt-v0.7.24-aarch64-macos.tar.gz"
      sha256 "ffb36e0455694b027f1f5e9df6dee14485e97254df152a2c9ecb40a273b1fa9b"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.24/jolt-v0.7.24-x86_64-linux.tar.gz"
      sha256 "fa69d93f7b12d393eebda78f2c3fb1de023754b0252f54076da0ab2d9ee4791e"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
