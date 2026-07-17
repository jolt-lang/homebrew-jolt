class Jolt < Formula
  desc "Clojure implementation on Chez Scheme — no JVM"
  homepage "https://jolt-lang.github.io/"
  license "EPL-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.1/joltc-v0.4.1-aarch64-macos.tar.gz"
      sha256 "2d7275619d5af0a32ba3723c3d6f1aec7d430517c054108c28b31e826f5ecfe0"
    end
    # No Intel macOS bottle: GitHub retired the macos-13 Intel runner. Intel
    # Macs build joltc from source (needs Chez Scheme + a C compiler).
  end

  on_linux do
    on_intel do
      url "https://github.com/jolt-lang/jolt/releases/download/v0.4.1/joltc-v0.4.1-x86_64-linux.tar.gz"
      sha256 "bd698d82e84658a62ed4e7fa2fa8d00a9f661094d53adc65cfa80b583cd0abab"
    end
  end

  def install
    bin.install "joltc"
  end

  test do
    assert_equal "3", shell_output("#{bin}/joltc -e '(+ 1 2)'").strip
  end
end
