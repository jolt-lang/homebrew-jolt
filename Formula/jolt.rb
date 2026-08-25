class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.26/jolt-v0.7.26-aarch64-macos.tar.gz"
      sha256 "ea30791236f1f69704963104fe88e1865df7ce093e2e16687478a9ce5d7ea338"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.7.26/jolt-v0.7.26-x86_64-linux.tar.gz"
      sha256 "105842010673627c9bf73f374d010299f73ae4f8a3208b512055845f8cdccf2d"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
