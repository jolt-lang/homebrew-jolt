class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.6.0/jolt-v0.6.0-aarch64-macos.tar.gz"
      sha256 "50dce3d42b41c7b5a359110b02480553cf4ecf969d063dac0acc75a69df625ab"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.6.0/jolt-v0.6.0-x86_64-linux.tar.gz"
      sha256 "720a019a187bfc02654a887394f01cb47a017d76b62efa1bf953dfe2c4c500f3"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
