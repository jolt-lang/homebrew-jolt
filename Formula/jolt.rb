class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.13/jolt-v0.5.13-aarch64-macos.tar.gz"
      sha256 "dff9d68a7cfc1ba006ce3f13d9c093b5012b42234b62c51dd5732b6f70995fc3"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.5.13/jolt-v0.5.13-x86_64-linux.tar.gz"
      sha256 "7c146fa3047af510c1af333dd1983a120f79a6a3d53ccd2385e6606a5f28d235"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
