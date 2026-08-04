class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.6.1/jolt-v0.6.1-aarch64-macos.tar.gz"
      sha256 "12caf6dd323e666e4e57ff7e4b5ffc774a2d7a3652cd07e59c383da8509d9b97"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.6.1/jolt-v0.6.1-x86_64-linux.tar.gz"
      sha256 "8a38eec9ca7d69d2c7e6af9bdb2b1a1983f11afead116cdf783c65b049ad8af4"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
