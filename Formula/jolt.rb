class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.6/jolt-v0.8.6-aarch64-macos.tar.gz"
      sha256 "60c708a7cb031c72a829b58f0f9e9a2b6e88e5713ac95eab6aeb1d83782748b4"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build jolt from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.8.6/jolt-v0.8.6-x86_64-linux.tar.gz"
      sha256 "3dab6373f2028efaf7a0e41231fc316de866e55454023c037e9d5981be6358c2"
    end
  end

  def install
    bin.install "jolt"
  end

  test do
    assert_equal "3", shell_output("#{bin}/jolt -e '(+ 1 2)'").strip
  end
end
